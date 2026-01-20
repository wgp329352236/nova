//
//  Created on 2024/6/16.
//

import Foundation

var SessionStorage: Dictionary<String, String> = Dictionary()

class SessionMutableKVStorage: MutableKVStorage {
    func allKeys() -> KotlinArray<NSString> {

        let kArray = KotlinArray<NSString>.init(size: 0) { _ in
            "" as NSString
        }

        let allKeys = [String](SessionStorage.keys)
        for index in 0..<allKeys.count {
            let key = allKeys[index]
            kArray.set(index: Int32(index), value: key as NSString)
        }
        return kArray
    }

    func remove(key: String) {
        SessionStorage.removeAll()
    }

    func set(key: String, data: String) {
        if key.isEmpty {
            mdebug("Can't set by a empty key")
            return
        }
        SessionStorage.updateValue(data, forKey: key)
    }

    func get(key: String) -> String {
        guard key.isEmpty, let idObject = SessionStorage[key] else {
            mdebug("Can't get Because key is empty or storage not contain this key")
            return ""
        }
        return idObject
    }
}

