//
//  Created on 2024/6/16.
//

import Foundation
import UIKit
import AdSupport
import AppTrackingTransparency
import CoreTelephony

var SDK_KEY_UDID: String = "com.sdk.key.udid"
var SDK_KEY_ADID: String = "com.sdk.key.adid"
var SDK_KEY_IDFA: String = "com.sdk.key.idfa"
var SDK_KEY_IDFV: String = "com.sdk.key.idfv"
var SDK_KEY_RANDOM: String = "com.sdk.key.random"


class SystemTools: NSObject {
    class func mainBundle() -> Dictionary<String, Any> {
        let dictionary = Bundle.main.infoDictionary!
        return dictionary
    }

    class func buildName() -> String {
        let value: String = mainBundle()["CFBundleName"] as? String ?? ""
        return value;
    }

    class func buildVersion() -> String {
        let value: String = mainBundle()["CFBundleVersion"] as? String ?? ""
        return value;
    }

    class func appName() -> String {
        let value: String = mainBundle()["CFBundleDisplayName"] as? String ?? ""
        return value;
    }

    class func appVersion() -> String {
        let value: String = mainBundle()["CFBundleShortVersionString"] as? String ?? ""
        return value;
    }

    class func appIdentifier() -> String {
        let value: String = mainBundle()["CFBundleIdentifier"] as? String ?? ""
        return value;
    }

    class func deviceModel() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else {
                return identifier
            }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }

        return identifier
    }

    class func deviceSystemVersion() -> String {
        let value: String = UIDevice.current.systemVersion;
        return value;
    }

    class func deviceSystemBuildVersion() -> String {
        var bufferSize: Int = 64
        var buffer = [CChar](repeating: 0, count: Int(bufferSize))
        let status: Int32 = sysctlbyname("kern.osversion", &buffer, &bufferSize, nil, 0);

        if (status != 0) {
            return ""
        }
        let value: String = String(cString: buffer, encoding: String.Encoding.utf8)!
        return value;
    }

    class func deviceUDID() -> String {

        func storage(_ value: String) -> String {
            let udid = [SDK_KEY_UDID: value]
            Keychain.saveData(data: udid, withIdentifier: SDK_KEY_UDID)
            kvStorage.set(key: SDK_KEY_UDID, data: value)
            return value
        }

        let idObject = Keychain.readData(identifier: SDK_KEY_UDID)

        //
        if let udidInfo = idObject as? Dictionary<String, String>, let udid = udidInfo[SDK_KEY_UDID], udid.isNotEmpty {
            return storage(udid)
        }

        // 在钥匙串后增加MMKV的读取
        let udid = kvStorage.get(key: SDK_KEY_UDID)
        if udid.isNotEmpty {
            // 如果读取成功，则存储
            return storage(udid)
        }

        // 6.x
        if let udid = idObject as? String, udid.isNotEmpty && udid.range(of: "00000000") == nil {
            return storage(udid)
        }

        // 首次创建应用
        let idfa = deviceIDFA()
        if idfa.isNotEmpty && idfa.range(of: "00000000") == nil {
            return storage(idfa)
        }

        let idfv = deviceIDFV()
        if idfv.isNotEmpty && idfv.range(of: "00000000") == nil {
            return storage(idfv)
        }

        let randomX = Int(arc4random() % 1000);
        let random = String(format: "SDK_RAND_\(NSDate().timeIntervalSince1970)%03d", randomX)
        return storage(random)
    }

    class func deviceIDFA() -> String {
        if #available(iOS 14, *) {
            if (ATTrackingManager.trackingAuthorizationStatus == .authorized) {
                return ASIdentifierManager.shared().advertisingIdentifier.uuidString
            }
        } else {
            if ASIdentifierManager.shared().isAdvertisingTrackingEnabled {
                return ASIdentifierManager.shared().advertisingIdentifier.uuidString
            }
        }
        return ""
    }

    private class func getIDFA(_ block: @escaping (_ IDFA: String) -> Void) {
        if #available(iOS 14.5, *) {
            ATTrackingManager.requestTrackingAuthorization { (status) in
                if status == .authorized {
                    let idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString
                    block(idfa)
                } else {
                    block("")
                }
            }
        } else {
            if ASIdentifierManager.shared().isAdvertisingTrackingEnabled {
                let idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString
                block(idfa)
            } else {
                block("")
            }
        }
    }

    class func deviceIDFV() -> String {
        let value: String = UIDevice.current.identifierForVendor?.uuidString ?? ""
        return value
    }

    class func deviceADID() -> String {
        let value: String = UIDevice.current.identifierForVendor?.uuidString ?? ""
        return value
    }

    static func deviceTotalRam() -> NSDecimalNumber {
        //UInt64
        let ram = Double(ProcessInfo.processInfo.physicalMemory)
        let ramString = String(format: "%.2f", (ram / 1024.0 / 1024.0) / 1024)
        return NSDecimalNumber(string: ramString)
    }

    static func deviceRunRam() -> NSDecimalNumber {
        let host_port: mach_port_t = mach_host_self()
        var host_size = mach_msg_type_number_t(MemoryLayout<vm_statistics_data_t>.stride / MemoryLayout<integer_t>.stride)
        var pagesize: vm_size_t = 0
        host_page_size(host_port, &pagesize)

        var usedBytes: size_t = 0
        var vm_statistics: vm_statistics = vm_statistics_data_t()

        let kernReturn: kern_return_t = withUnsafeMutableBytes(of: &vm_statistics) { [vm_statistics] aBytes in
            let boundPtr = aBytes.baseAddress?.bindMemory(to: Int32.self, capacity: MemoryLayout.size(ofValue: vm_statistics) / MemoryLayout<Int32>.stride)
            return host_statistics(host_port, HOST_VM_INFO, boundPtr, &host_size)
        }

        if (KERN_SUCCESS != kernReturn) {
            usedBytes = 0
        } else {
            usedBytes = (size_t)((vm_size_t)(vm_statistics.active_count + vm_statistics.inactive_count + vm_statistics.wire_count) * pagesize)
        }

        let ramString = String(format: "%.2f", (Double(usedBytes) / 1024.0 / 1024.0) / 1024)
        return NSDecimalNumber(string: ramString)
    }

    static func gameUseRam() -> NSDecimalNumber {
        var taskInfo: task_basic_info = task_basic_info_data_t()
        var host_size = mach_msg_type_number_t(MemoryLayout<vm_statistics_data_t>.stride / MemoryLayout<natural_t>.stride)
        let kernReturn: kern_return_t = withUnsafeMutableBytes(of: &taskInfo) { [taskInfo] aBytes in
            let boundPtr = aBytes.baseAddress?.bindMemory(to: Int32.self, capacity: MemoryLayout.size(ofValue: taskInfo) / MemoryLayout<Int32>.stride)
            return task_info(mach_task_self_, task_flavor_t(TASK_BASIC_INFO), boundPtr, &host_size)
        }

        var usedBytes: size_t = 0
        if (kernReturn != KERN_SUCCESS) {
            return 0
        }

        usedBytes = (size_t)(taskInfo.resident_size)
        let ramString = String(format: "%.2f", (Double(usedBytes) / 1024.0 / 1024.0) / 1024)
        return NSDecimalNumber(string: ramString)
    }

    static func freeStorageSpace() -> NSDecimalNumber {
        var _freeBytes = 0
        let paths: [String] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        do {
            let dictionary = try FileManager.default.attributesOfFileSystem(forPath: paths.last!)
            let _free = dictionary[.systemFreeSize] as! NSNumber
            _freeBytes = _free.intValue
        } catch {

        }

        let ramString = String(format: "%.2f", (Double(_freeBytes) / 1024.0 / 1024.0) / 1024)
        return NSDecimalNumber(string: ramString)
    }

    static func networkOperator() -> String {
        let networkInfo: CTTelephonyNetworkInfo = CTTelephonyNetworkInfo()
        guard let carrier = networkInfo.subscriberCellularProvider else {
            return "_"
        }
        let mcc = carrier.mobileCountryCode ?? ""
        let mnc = carrier.mobileNetworkCode ?? ""
        return mcc + mnc
    }

    static func networkType() -> String {
        if let reachability = BaseBridge.shared.reachability {
            if reachability.currentReachabilityStatus == .reachableViaWiFi {
                return "WIFI"
            }
        }

        let networkInfo = CTTelephonyNetworkInfo()
        let status = networkInfo.currentRadioAccessTechnology
        var networkType = "WIFI"
        switch status {
        case CTRadioAccessTechnologyGPRS: networkType = "GPRS"; break
        case CTRadioAccessTechnologyEdge: networkType = "2.75G EDGE"; break
        case CTRadioAccessTechnologyWCDMA: networkType = "3G"; break
        case CTRadioAccessTechnologyHSDPA: networkType = "3.5G HSDPA"; break
        case CTRadioAccessTechnologyHSUPA: networkType = "3.5G HSDPA"; break
        case CTRadioAccessTechnologyCDMA1x: networkType = "2G"; break
        case CTRadioAccessTechnologyCDMAEVDORev0: networkType = "3G"; break
        case CTRadioAccessTechnologyCDMAEVDORevA: networkType = "3G"; break
        case CTRadioAccessTechnologyCDMAEVDORevB: networkType = "3G"; break
        case CTRadioAccessTechnologyeHRPD: networkType = "HRPD"; break
        case CTRadioAccessTechnologyLTE: networkType = "4G"; break
        case "CTRadioAccessTechnologyNRNSA": networkType = "5G"; break
        case "CTRadioAccessTechnologyNR": networkType = "5G"; break
        default:
            break
        }

        return networkType
    }

    class func clientIP() -> String {
        if let deviceIp = deviceIP(), deviceIp.isNotEmpty {
            return deviceIp
        }
        if let wifiIp = wifiIP(), wifiIp.isNotEmpty {
            return wifiIp
        }
        return ""
    }

    private class func deviceIP() -> String? {
        var addresses = [String]()
        var ifaddr: UnsafeMutablePointer<ifaddrs>? = nil
        if getifaddrs(&ifaddr) == 0 {
            var ptr = ifaddr
            while (ptr != nil) {
                let flags = Int32(ptr!.pointee.ifa_flags)
                var addr = ptr!.pointee.ifa_addr.pointee
                if (flags & (IFF_UP | IFF_RUNNING | IFF_LOOPBACK)) == (IFF_UP | IFF_RUNNING) {
                    if addr.sa_family == UInt8(AF_INET) || addr.sa_family == UInt8(AF_INET6) {
                        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                        if (getnameinfo(&addr, socklen_t(addr.sa_len), &hostname, socklen_t(hostname.count), nil, socklen_t(0), NI_NUMERICHOST) == 0) {
                            if let address = String(validatingUTF8: hostname) {
                                addresses.append(address)
                            }
                        }
                    }
                }
                ptr = ptr!.pointee.ifa_next
            }
            freeifaddrs(ifaddr)
        }

        return addresses.first
    }

    private class func wifiIP() -> String? {
        var address: String? = nil
        var ifaddr: UnsafeMutablePointer<ifaddrs>? = nil
        guard getifaddrs(&ifaddr) == 0 else {
            return nil
        }

        guard let firstAddr = ifaddr else {
            return nil
        }

        for ifptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
            let interface = ifptr.pointee
            // Check for IPV4 or IPV6 interface
            let addrFamily = interface.ifa_addr.pointee.sa_family
            if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                // Check interface name
                let name = String(cString: interface.ifa_name)
                if name == "en0" {
                    // Convert interface address to a human readable string
                    var addr = interface.ifa_addr.pointee
                    var hostName = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                    getnameinfo(&addr, socklen_t(interface.ifa_addr.pointee.sa_len), &hostName, socklen_t(hostName.count), nil, socklen_t(0), NI_NUMERICHOST)
                    address = String(cString: hostName)
                }
            }
        }

        freeifaddrs(ifaddr)
        return address
    }
}


