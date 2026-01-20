//
//  ToolFunction.swift
//  NovaSDK
//
//

import Foundation

class ToolFunction: ToolFunctionInterface {

    func encodeBase64(str: String) -> String {
        str.encodeBase64 ?? ""
    }

    func decodeBase64(str: String) -> String {
        str.decodeBase64 ?? ""
    }

    func md5(str: String) -> String {
        str.md5
    }


    func rc4(key: String, str: String) -> KotlinByteArray {
        let encrypted = RC4Interior.encrypt(data: [UInt8](str.utf8), key: [UInt8](key.utf8))
        let byteArray = KotlinByteArray(size: Int32(encrypted.count))
        for idx in 0..<encrypted.count {
            byteArray.set(index: Int32(idx), value: Int8(bitPattern: encrypted[idx]))
        }
        return byteArray
    }


    func netPing(count: Int32, target: String, callback: @escaping ([String]) -> Void) -> Waitable {
        BlockHelper(waitFor: nil)
    }

    func netTraceroute(target: String, port: String, maxHop: Int32, callback: @escaping ([String]) -> Void) -> Waitable {
        BlockHelper(waitFor: nil)
    }


}
