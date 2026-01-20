//
//

import Foundation
import Network

class DnsClient: DnsClientEngine {

    static let shared = DnsClient()

    // 请求超时时间
    private let requestTimeout: TimeInterval = 30.0

    public func resolve(host: String) -> PromiseInterface<NSString> {
        let host = stripProtocol(from: host)
        let promise = Promise<NSString>(waitFor: nil)
        DispatchQueue.main.async {
            if let ips = self.lookup(host) {
                promise.resolve(result: ips.joined(separator: ",") as NSString)
            } else {
                promise.reject(reason: Throwable("DNS 解析失败"))
            }
        }
        return promise
    }

    private func lookup(_ host: String) -> [String]? {
        let hostRef = CFHostCreateWithName(nil, host as CFString).takeRetainedValue()
        var resolved: DarwinBoolean = false

        if CFHostStartInfoResolution(hostRef, .addresses, nil),
           let results = CFHostGetAddressing(hostRef, &resolved)?.takeUnretainedValue() as NSArray? {
            let ips = results.compactMap { item -> String? in
                guard let addr = item as? Data else {
                    return nil
                }
                let sockaddrPtr = addr.withUnsafeBytes {
                    $0.baseAddress!.assumingMemoryBound(to: sockaddr.self)
                }
                var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                if getnameinfo(sockaddrPtr, socklen_t(addr.count), &hostname,
                        socklen_t(hostname.count), nil, 0, NI_NUMERICHOST) == 0 {
                    return String(cString: hostname)
                }
                return nil
            }
            return ips
        }
        return nil
    }

    // MARK: -- query
    public func query(domain: String) -> PromiseInterface<NSString> {
        let domain = stripProtocol(from: domain)
        // 随机选择第一个服务器尝试
        let promise = Promise<NSString>(waitFor: nil)
        query(domain) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let ips):
                    promise.resolve(result: ips as NSString)
                case .failure(let error):
                    promise.reject(reason: Throwable(error.localizedDescription))
                }
            }
        }
        return promise
    }

    private func urlSession(for domain: String) -> URLSession {
        let config = URLSessionConfiguration.default
        let delegate = NetworkSessionDelegate(domain)
        return URLSession(configuration: config, delegate: delegate, delegateQueue: nil)
    }

    private func stripProtocol(from domain: String) -> String {
        var cleaned = domain
        if cleaned.hasPrefix("http://") {
            cleaned = String(cleaned.dropFirst("http://".count))
        } else if cleaned.hasPrefix("https://") {
            cleaned = String(cleaned.dropFirst("https://".count))
        }

        // 移除路径部分（如果有）
        if let pathRange = cleaned.range(of: "/") {
            cleaned = String(cleaned[..<pathRange.lowerBound])
        }

        return cleaned
    }

    func query(
            _ domain: String,
            completion: @escaping (Result<String, DNSError>) -> Void
    ) {
        let baseUrl = "https://dns.google/resolve?name=\(domain)&type=A"
        guard let url = URL(string: baseUrl) else {
            completion(.failure(.invalidURL))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = requestTimeout
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        // 4. 发送网络请求
        let dataTask = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else {
                return
            }

            // 处理网络错误
            if let error = error {
                print("error: \(error)")
                if (error as NSError).code == NSURLErrorTimedOut {
                    completion(.failure(.requestTimeout))
                } else {
                    completion(.failure(.networkError(error.localizedDescription)))
                }
                return
            }

            // 处理空响应
            guard let data = data else {
                completion(.failure(.emptyResponse))
                return
            }

            // 处理 HTTP 状态码
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                completion(.failure(.invalidHTTPStatus(httpResponse.statusCode)))
                return
            }

            // 解析 DNS 响应
            do {
                let records = try self.parseDNSResponse(data: data)
                let result = records.joined(separator: ",")
                completion(.success(result.isEmpty ? "无解析记录" : result))
            } catch let error as DNSError {
                completion(.failure(error))
            } catch {
                completion(.failure(.parsingFailed(error.localizedDescription)))
            }
        }
        dataTask.resume()
    }

    /// 解析DNS响应消息
    private func parseDNSResponse(data: Data) throws -> [String] {
        do {
            guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                throw DNSError.invalidData
            }
            if let answers = json["Answer"] as? [[String: Any]] {
                var ips: [String] = []
                for answer in answers {
                    if let type = answer["type"] as? Int, type == 1,
                       let ip = answer["data"] as? String {
                        ips.append(ip)
                    }
                }
                return ips
            } else {
                return []
            }
        } catch {
            throw DNSError.parsingFailed(error.localizedDescription)
        }
    }

    /// DNS 错误类型（扩展更多场景）
    enum DNSError: Error, LocalizedError {
        case invalidURL // 无效 URL
        case noAvailableServer // 无可用 DoH 服务器
        case networkError(String) // 网络错误
        case requestTimeout // 请求超时
        case emptyResponse // 空响应
        case invalidHTTPStatus(Int) // 无效 HTTP 状态码
        case invalidData // 无效二进制数据
        case parsingFailed(String) // 解析失败

        var errorDescription: String? {
            switch self {
            case .invalidURL: return "无效的 DoH 服务器 URL"
            case .noAvailableServer: return "无可用的 DoH 服务器"
            case .networkError(let msg): return "网络请求失败：\(msg)"
            case .requestTimeout: return "DoH 请求超时"
            case .emptyResponse: return "DoH 服务器返回空响应"
            case .invalidHTTPStatus(let code): return "无效的 HTTP 状态码：\(code)"
            case .invalidData: return "无效的 DNS 二进制响应数据"
            case .parsingFailed(let msg): return "DNS 响应解析失败：\(msg)"
            }
        }
    }

}
