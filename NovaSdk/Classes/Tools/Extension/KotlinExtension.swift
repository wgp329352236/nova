//
//  KotlinExtension.swift
//  NovaSDK
//
//

import Foundation

@discardableResult
func exchange<T>(
        _ ktArray: KotlinArray<T>,
        _ array: inout [T]
) -> [T] {
     for idx in 0..<ktArray.size {
        let element = ktArray.get(index: idx)
        array.append(element!)
    }
    return array
}

extension KotlinByteArray {

    func toData() -> Data {
        var bytes = [UInt8](repeating: 0, count: Int(size))
        for idx in 0..<size {
            bytes[Int(idx)] = UInt8(bitPattern: self.get(index: Int32(idx)))
        }
        return Data(_: bytes)
    }

    func toBytes() -> [UInt8] {
        var bytes = [UInt8](repeating: 0, count: Int(size))
        for idx in 0..<size {
            bytes[Int(idx)] = UInt8(bitPattern: self.get(index: Int32(idx)))
        }
        return bytes
    }

    func get(_ data: [UInt8]) -> KotlinByteArray {
        let array = KotlinByteArray(size: Int32(data.count))
        for idx in 0..<data.count {
            array.set(index: Int32(idx), value: Int8(bitPattern: data[idx]))
        }
        return array
    }

}


extension KotlinArray {

    @objc
    func asArray() -> [AnyObject] {
        var array: [AnyObject] = []
        for idx in 0..<size {
            let element = get(index: idx)
            array.append(element as AnyObject)
        }
        return array
    }

    @objc 
    func empty() -> KotlinArray<AnyObject> {
        KotlinArray<AnyObject>(size: 0) { _ in
            "" as AnyObject
        }
    }

}
