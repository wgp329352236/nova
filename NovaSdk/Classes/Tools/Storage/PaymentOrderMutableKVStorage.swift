//
//  Created on 2024/6/16.
//

import Foundation


class PaymentOrderMutableKVStorage: MutableKVStorage {


    var orderStorage: MMKV? {
        guard let mmkv = MMKV(mmapID: "PAYMENT_ORDER", mode: .singleProcess) else {
            mdebug("mmkv open error")
            return nil
        }
        return mmkv
    }

    func allKeys() -> KotlinArray<NSString> {
        guard let orderKeys = orderStorage?.allKeys() else {
            return KotlinArray.init(size: 0) { _ in
                ""
            }
        }
        let kArray = KotlinArray<NSString>.init(size: Int32(orderKeys.count)) { _ in
            ""
        }

        for index in 0..<orderKeys.count {
            if let key = (orderStorage?.allKeys()[index]) as? String {
                kArray.set(index: Int32(index), value: key as NSString)
            }
        }
        return kArray
    }

    func remove(key: String) {
        orderStorage!.removeValue(forKey: key)
    }

    func set(key: String, data: String) {
        orderStorage!.set(data, forKey: key)
    }

    func get(key: String) -> String {
        guard let data = orderStorage!.data(forKey: key) else {
            return ""
        }
        return String(data: data, encoding: .utf8) ?? ""
    }
}

