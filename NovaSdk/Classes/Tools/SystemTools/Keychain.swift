//
//  Created on 2024/6/16.
//

import Foundation
import Security

struct KeyedArchiver {
    var userDefault = UserDefaults.standard

    static func archivedData(_ data: Any, _ key: String) -> Data {
        if #available(iOS 11.0, *) {
            do {
                return try NSKeyedArchiver.archivedData(withRootObject: data, requiringSecureCoding: false)
            } catch {
                return Data.init()
            }
        } else {
            return NSKeyedArchiver.archivedData(withRootObject: data)
        }
    }

    static func archiveRootObject(_ rootObject: Any, toFile path: String) -> Bool {
        if #available(iOS 11.0, *) {
            do {
                let data: Data = try NSKeyedArchiver.archivedData(withRootObject: rootObject, requiringSecureCoding: false)
                try! data.write(to: URL(string: path)!, options: .atomicWrite)
                return true
            } catch {
                return false
            }
        } else {
            return NSKeyedArchiver.archiveRootObject(rootObject, toFile: path)
        }
    }
}

struct KeyedUnarchiver {
    static func unarchiveObject(_ filePath: String) -> Any? {
        NSKeyedUnarchiver.unarchiveObject(withFile: filePath)
    }
}

class Keychain: NSObject {

    class func createQuery(identifier: String) -> NSMutableDictionary {
        let keychainQueryMutableDictionary = NSMutableDictionary.init(capacity: 0)
        keychainQueryMutableDictionary.setValue(kSecClassGenericPassword, forKey: kSecClass as String)
        keychainQueryMutableDictionary.setValue(identifier, forKey: kSecAttrService as String)
        keychainQueryMutableDictionary.setValue(identifier, forKey: kSecAttrAccount as String)
        keychainQueryMutableDictionary.setValue(kSecAttrAccessibleAfterFirstUnlock, forKey: kSecAttrAccessible as String)
        return keychainQueryMutableDictionary
    }

    @discardableResult
    class func saveData(data: Any, withIdentifier identifier: String) -> Bool {
        let keyChainSaveMutableDictionary = createQuery(identifier: identifier)
        SecItemDelete(keyChainSaveMutableDictionary)
        keyChainSaveMutableDictionary.setValue(NSKeyedArchiver.archivedData(withRootObject: data), forKey: kSecValueData as String)
        let saveState = SecItemAdd(keyChainSaveMutableDictionary, nil)
        if saveState == noErr {
            return true
        }
        return false
    }

    class func update(data: Any, withIdentifier identifier: String) -> Bool {
        let keyChainUpdateMutableDictionary = createQuery(identifier: identifier)
        let updateMutableDictionary = NSMutableDictionary.init(capacity: 0)
        updateMutableDictionary.setValue(NSKeyedArchiver.archivedData(withRootObject: data), forKey: kSecValueData as String)
        let updateStatus = SecItemUpdate(keyChainUpdateMutableDictionary, updateMutableDictionary)
        if updateStatus == noErr {
            return true
        }
        return false
    }


    class func readData(identifier: String) -> Any? {
        var idObject: Any?
        let keyChainReadMutableDictionary = createQuery(identifier: identifier)
        keyChainReadMutableDictionary.setValue(kCFBooleanTrue, forKey: kSecReturnData as String)
        keyChainReadMutableDictionary.setValue(kSecMatchLimitOne, forKey: kSecMatchLimit as String)
        var queryResult: AnyObject?
        let readStatus = withUnsafeMutablePointer(to: &queryResult) {
            SecItemCopyMatching(keyChainReadMutableDictionary, UnsafeMutablePointer($0))
        }
        if readStatus == errSecSuccess {
            if let data = queryResult as? NSData {
                idObject = NSKeyedUnarchiver.unarchiveObject(with: data as Data)
            }
        }
        return idObject
    }


    class func delete(identifier: String) -> Void {
        let keyChainDeleteMutableDictionary = createQuery(identifier: identifier)
        SecItemDelete(keyChainDeleteMutableDictionary)
    }
}



