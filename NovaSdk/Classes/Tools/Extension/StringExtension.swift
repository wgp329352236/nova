//
//  Created on 2024/6/16.
//

import Foundation
import CommonCrypto

extension String {

    var rc4: Data {
//        let key = LocalConfig.shared.mdata_security_key!
        let key = ""
        return RC4.encrypt(key: key, str: self)
    }

    var md5: String {
        let utf8 = cString(using: .utf8)
        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5(utf8, CC_LONG(utf8!.count - 1), &digest)
        return digest.reduce("") {
            $0 + String(format: "%02X", $1)
        }
    }

    /***
     * encode or decode
     *
     */
    var encodeBase64: String? {
        if let data = data(using: .utf8, allowLossyConversion: true) {
            return data.base64EncodedString()
        }
        return nil
    }

    var decodeBase64: String? {
        if let data = Data.init(base64Encoded: self) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }

    public var isNotEmpty: Bool {
        return (!isEmpty) && (count > 0)
    }

    var isNumber: Bool {
        let scan: Scanner = Scanner(string: self)
        var val: Int = 0
        return scan.scanInt(&val) && scan.isAtEnd
    }

    var isEmail: Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }

    func dateFormatter() -> String {
        let timeInterval: TimeInterval = TimeInterval(Double(self)!)
        return timeInterval.dateFormatter()
    }

    func toUUID() -> UUID? {
        var uuid = "00000000-0000-0000-0000-000000000000"
        if self.isEmpty {
            return UUID.init(uuidString: uuid)
        }

        let inputLength = self.count

        var encodedString = ""
        if inputLength < 32 {
            let padding = 31 - inputLength
            let paddingString = String(repeating: "0", count: padding)
            encodedString = paddingString + "A" + self
        } else if inputLength > 32 {
            encodedString = String(suffix(32))
        } else {
            encodedString = self
        }

        if encodedString.count == 32 {
            uuid = String(encodedString.prefix(8)) + "-" +
                    String(encodedString.dropFirst(8).prefix(4)) + "-" +
                    String(encodedString.dropFirst(12).prefix(4)) + "-" +
                    String(encodedString.dropFirst(16).prefix(4)) + "-" +
                    String(encodedString.dropFirst(20))
        }

        return UUID.init(uuidString: uuid)
    }

}

extension TimeInterval {
    func dateFormatter() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateStyle  = .medium
        dateFormatter.timeStyle  = .short
        let date = Date(timeIntervalSince1970: self)
        let formatString: String = dateFormatter.string(from: date)
        return formatString
    }
}


