//
//  Created on 2024/6/16.
//

import Foundation

extension Dictionary {
    func percentEscaped() -> String {
        map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return "\(escapedKey)=\(escapedValue)"
        }
                .joined(separator: "&")
    }

    func toJson() -> String? {
        let jsonData = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
        if let data = jsonData {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
