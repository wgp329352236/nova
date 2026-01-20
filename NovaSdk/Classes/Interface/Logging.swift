//
//  Created on 2024/6/16.
//

import Foundation

public func mdebug(_ message: String) {
    runInMain {
        LoggingKt.mdebug(message: message, args: KotlinArray(size: 0, init: { _ in "" as AnyObject }))
    }
}

public func mdebug(_ message: String, _ args: String...) {
    runInMain {
        LoggingKt.mdebug(message: String(format: message, args), args: KotlinArray(size: 0, init: { _ in "" as AnyObject }))
    }
}

public func minfo(_ message: String, _ args: String...) {
    LoggingKt.minfo(message: String(format: message, arguments: args), args: KotlinArray(size: 0, init: { _ in "" as AnyObject }))
}

public func merror(_ message: String) {
    runInMain {
        LoggingKt.merror(message: message, args: KotlinArray(size: 0, init: { _ in "" as AnyObject }))
    }
}

public func merror(_ message: String, _ args: String...) {
    runInMain {
        LoggingKt.merror(message: String(format: message, arguments: args), args: KotlinArray(size: 0, init: { _ in "" as AnyObject }))
    }
}

public func mfatal(_ message: String, _ args: String...) {
    LoggingKt.mfatal(message: String(format: message, arguments: args), args: KotlinArray(size: 0, init: { _ in "" as AnyObject }))
}

public func mnotice(_ message: String, _ args: String...) {
    LoggingKt.mnotice(message: String(format: message, arguments: args), args: KotlinArray(size: 0, init: { _ in "" as AnyObject }))
}

public func mtrace(_ level: LogLevel, _ message: String, _ args: String...) {
    LoggingKt.mtrace(level: level, message: String(format: message, arguments: args), args: KotlinArray(size: 0, init: { _ in "" as AnyObject }))
}

public func mwarning(_ message: String, _ args: String...) {
    LoggingKt.mwarning(message: String(format: message, arguments: args), args: KotlinArray(size: 0, init: { _ in "" as AnyObject }))
}


