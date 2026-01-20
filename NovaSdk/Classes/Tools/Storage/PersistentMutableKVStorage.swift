//
//  Created on 2024/6/16.
//

import Foundation


class PersistentMutableKVStorage: MutableKVStorage {

    var keys = PersistentKey()

    private var persistentStorage: MMKV? {
        guard let mmkv = MMKV.default() else {
            mdebug("mmkv open error")
            return nil
        }
        return mmkv
    }

    func allKeys() -> KotlinArray<NSString> {
        guard let persistentKeys = persistentStorage?.allKeys() else {
            mdebug("获取本地缓存信息失败")
            return KotlinArray.init(size: 0) { _ in
                "" as NSString
            }
        }

        let kArray = KotlinArray.init(size: Int32(persistentKeys.count)) { _ in
            "" as NSString
        }

        for index in 0..<persistentKeys.count {
            if let key = (persistentStorage?.allKeys()[index]) as? String {
                kArray.set(index: Int32(index), value: key as NSString)
            }
        }
        return kArray
    }

    func remove(key: String) {
        persistentStorage?.removeValue(forKey: key)
    }

    func set(key: String, data: String) {
        guard let mmkv = MMKV.default() else {
            return
        }
        mmkv.set(data, forKey: key)
    }

    func get(key: String) -> String {
        guard let mmkv = MMKV.default(), let data = mmkv.data(forKey: key) else {
            return ""
        }
        return String(data: data, encoding: .utf8) ?? ""
    }
}

