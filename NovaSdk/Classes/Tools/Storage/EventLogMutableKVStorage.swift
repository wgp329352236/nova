//
//  Created on 2024/6/16.
//

import Foundation

class EventLogMutableKVStorage: MutableKVStorage {
    var eventLogStorage: MMKV? {
        guard let mmkv = MMKV(mmapID: "EVENT_LOG", mode: .singleProcess) else {
            mdebug("mmkv open error")
            return nil
        }
        return mmkv
    }

    func allKeys() -> KotlinArray<NSString> {
        guard let eventLogKeys = eventLogStorage?.allKeys() else {
            return KotlinArray.init(size: 0) { _ in
                ""
            }
        }
        let kArray = KotlinArray<NSString>.init(size: Int32(eventLogKeys.count)) { _ in
            "" as NSString
        }

        for index in 0..<eventLogKeys.count {
            if let key = (eventLogStorage?.allKeys()[index]) as? String {
                kArray.set(index: Int32(index), value: key as NSString)
            }
        }
        return kArray
    }

    func remove(key: String) {
        eventLogStorage!.removeValue(forKey: key)
    }

    func set(key: String, data: String) {
        eventLogStorage!.set(data, forKey: key)
    }

    func get(key: String) -> String {
        guard let data = eventLogStorage!.data(forKey: key) else {
            return ""
        }
        return String(data: data, encoding: .utf8) ?? ""
    }
}

