//
//  Created on 2024/6/25.
//

import Foundation

extension Array {
    static func parse<T>(_ data: KotlinArray<T>) -> [T] {
        var array: [T] = []
        for idx in 0..<data.size {
            let element = data.get(index: idx)
            if element != nil {
                array.append(element!)
            }
        }
        return array
    }

    func convertToKotlinArray<T>() -> KotlinArray<T> {
        let array = KotlinArray<T>(size: 0) { (index: KotlinInt) -> T? in
            (self[index.intValue] as! T)
        }
        return array
    }

    func toKotlin<T>() -> KotlinArray<T> {
        let array = KotlinArray<T>(size: Int32(self.count)) { (index: KotlinInt) -> T? in
            (self[index.intValue] as! T)
        }
        return array
    }

}

// 扩展方法
extension Array where Element == Any {
    func firstAs<T>(ofType _: T.Type) -> T? {
        for element in self {
            if let value = element as? T {
                return value
            }
        }
        return nil
    }
}