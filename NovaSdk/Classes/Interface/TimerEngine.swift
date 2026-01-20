//
//  Created on 2024/6/16.
//

import Foundation

public class IOSTimerEngine: NovaCore.TimerEngine {
    public static let shared: IOSTimerEngine = {
        let instance = IOSTimerEngine()
        return instance
    }()

    private lazy var timer: DispatchSourceTimer = {
        DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.global())
    }()

    public func resume() {
        if !timer.isCancelled {
            timer.resume()
        }
    }

    public func event(task: @escaping () -> Void) {
        timer.schedule(deadline: .now(), repeating: .seconds(10), leeway: .milliseconds(10))
        timer.setEventHandler {
            DispatchQueue.main.async {
                task()
            }
        }
    }

    public func start() {
        timer.resume()
    }

    public func suspend() {
        timer.suspend()
    }

    public func cancel() {
        timer.cancel()
    }

    private lazy var mdataTimer: DispatchSourceTimer = {
        DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.global())
    }()

    public func schedule(task: @escaping () -> Void) {
        mdataTimer.schedule(deadline: .now(), repeating: .seconds(10), leeway: .milliseconds(10))
        mdataTimer.setEventHandler {
            DispatchQueue.main.async {
                task()
            }
        }
        mdataTimer.resume()
    }

}

