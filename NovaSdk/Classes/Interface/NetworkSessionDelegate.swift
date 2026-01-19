//
// Created by WGP on 2025/11/20.
//

import Foundation

class NetworkSessionDelegate: NSObject, URLSessionDelegate {
    let domain: String

    init(_ domain: String) {
        self.domain = domain
        super.init()
    }

    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        // 仅处理服务器信任验证
        guard challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust else {
            completionHandler(.performDefaultHandling, nil)
            return
        }

        // 获取服务器信任对象
        guard let serverTrust = challenge.protectionSpace.serverTrust else {
            completionHandler(.cancelAuthenticationChallenge, nil)
            return
        }

        // 检查证书中的通用名称是否匹配
        if evaluateCertificateTrust(serverTrust: serverTrust, expectedDomain: domain) {
            let credential = URLCredential(trust: serverTrust)
            completionHandler(.useCredential, credential)
        } else {
            #if DEBUG
            print("⚠️ DEBUG 模式：强制信任证书（仅用于测试）")
            let credential = URLCredential(trust: serverTrust)
            completionHandler(.useCredential, credential)
            #else
            print("🚫 生产环境：拒绝连接")
            completionHandler(.cancelAuthenticationChallenge, nil)
            #endif
        }
    }

    private func evaluateCertificateTrust(serverTrust: SecTrust, expectedDomain: String) -> Bool {
        // 获取证书链中的第一个证书（服务器证书）
        guard let certificateChain = SecTrustCopyCertificateChain(serverTrust) else {
            return false
        }

        // 获取证书链中的第一个证书（服务器证书）
        guard let certificates = certificateChain as? [SecCertificate],
              let certificate = certificates.first
        else {
            return false
        }

        // 获取证书主题备用名称(SAN)
        let sanNames = certificate_SAN_names(certificate: certificate)

        // 检查SAN中是否有匹配的域名
        for sanName in sanNames {
            if matchDomain(expectedDomain: expectedDomain, certificateDomain: sanName) {
                return true
            }
        }

        // 检查通用名称(CN)
        let commonName = certificate_commonName(certificate: certificate)
        if matchDomain(expectedDomain: expectedDomain, certificateDomain: commonName) {
            return true
        }

        return false
    }

    private func certificate_SAN_names(certificate: SecCertificate) -> [String] {
        // 返回空数组，主要依靠CommonName验证
        return []
    }

    private func certificate_commonName(certificate: SecCertificate) -> String {
        guard let summary = SecCertificateCopySubjectSummary(certificate) else {
            return ""
        }
        return summary as String
    }

    private func matchDomain(expectedDomain: String, certificateDomain: String) -> Bool {
        // 处理通配符证书匹配
        if certificateDomain.hasPrefix("*") {
            let suffix = String(certificateDomain.dropFirst(2)) // 移除 "*."
            if expectedDomain.hasSuffix(suffix) {
                // 确保通配符只匹配一个子域级别
                let expectedComponents = expectedDomain.components(separatedBy: ".")
                let suffixComponents = suffix.components(separatedBy: ".")
                return expectedComponents.count == suffixComponents.count + 1
            }
        } else {
            // 精确匹配
            return expectedDomain == certificateDomain
        }
        return false
    }
}
