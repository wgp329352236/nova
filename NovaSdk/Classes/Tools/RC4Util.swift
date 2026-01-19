//
//  RC4Util.swift
//  NovaSDK
//
//   Created on 2024/6/16.
//

import Foundation

class RC4 {
    static func encrypt(key: String, str: String) -> Data {
        let source = [UInt8](str.utf8)
        let key = [UInt8](key.utf8)
        let results = RC4Interior.encrypt(data: source, key: key)
        return Data(_: results)
    }
}

struct RC4Interior {
    var State: [UInt8]
    var I: UInt8 = 0
    var J: UInt8 = 0

    init() {
        State = [UInt8](repeating: 0, count: 256)
    }

    mutating
    func initialize(_ Key: [UInt8]) {
        for i in 0..<256 {
            State[i] = UInt8(i)
        }

        var j: UInt8 = 0
        for i in 0..<256 {
            let K: UInt8 = Key[i % Key.count]
            let S: UInt8 = State[i]
            j = j &+ S &+ K
            swapByIndex(i, y: Int(j))
        }
    }

    mutating
    func swapByIndex(_ x: Int, y: Int) {
        let T1: UInt8 = State[x]
        let T2: UInt8 = State[y]
        State[x] = T2
        State[y] = T1
    }

    mutating
    func next() -> UInt8 {
        I = I &+ 1
        J = J &+ State[Int(I)]
        swapByIndex(Int(I), y: Int(J))
        return State[Int(State[Int(I)] &+ State[Int(J)]) & 0xFF]
    }

    mutating
    func encrypt(_ Data: inout [UInt8]) {
        let cnt = Data.count
        for i in 0..<cnt {
            Data[i] = Data[i] ^ next()
        }
    }

    static func encrypt(data: [UInt8], key: [UInt8]) -> [UInt8] {
        var ret = data
        var enc = RC4Interior()
        enc.initialize(key)
        enc.encrypt(&ret)
        return ret
    }
}
