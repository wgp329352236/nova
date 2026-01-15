


import MMKV
import NovaCore

public class NovaKit: NSObject {

    @objc(sharedInstance)
    public static let shared: NovaKit = {
        let instance = NovaKit()
        return instance
    }()

    @objc
    public func initialize(isDebug: Bool, language: Language) {
        MMKV.initialize(rootDir: nil, logLevel: .error)
    }
    
    
    
    
    
    
}
