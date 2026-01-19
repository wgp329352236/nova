//
//  RestfulHttpEngine.swift
//  NovaSDK
//
//

import Foundation

public class IOSRestfulHttpEngine: RestfulHttpEngine {

    public init() {
    }

    public static let shared: IOSRestfulHttpEngine = {
        let instance = IOSRestfulHttpEngine()
        return instance
    }()

    private func urlSession(for domain: String) -> URLSession {
        let config = URLSessionConfiguration.default
        let delegate = NetworkSessionDelegate(domain)
        return URLSession(configuration: config, delegate: delegate, delegateQueue: nil)
    }

    //
    public func requestAsync(
            uri: String,
            onSuccess: @escaping (RestfulHttpResponse) -> Void,
            onError: @escaping (KotlinThrowable) -> Void,
            method: HttpMethod,
            headers: [String: String],
            data: [String: Any],
            timeoutInMillisecond: Int64) -> Waitable {

        let blocker = BlockHelper.init(waitFor: nil)
        guard let urlComponent = URLComponents(string: uri), let usableUrl = urlComponent.url else {
            printLog("Invalid uri value")
            return blocker
        }

        // init request
        var request = URLRequest(url: usableUrl)

        // set method
        request.httpMethod = method.value

        // set header
        for (headerKey, headerVal) in headers {
            if headerKey == "Origin" {
                request.addValue(headerVal, forHTTPHeaderField: "Origin")
                continue
            }
            request.setValue(headerVal, forHTTPHeaderField: headerKey)
        }

        // set timeout
        request.timeoutInterval = TimeInterval(timeoutInMillisecond)

        // set post body
        if method.value != "GET" {
            if let postString = data["JSON_BODY"] {
                switch postString {
                case is KotlinByteArray:
                    request.httpBody = (postString as! KotlinByteArray).toData()
                    break
                case is KotlinArray<AnyObject>:
                    request.httpBody = (postString as! KotlinByteArray).toData()
                    break
                case is String:
                    request.httpBody = (postString as! String).data(using: .utf8)
                    break
                default:
                    merror("JSON_BODY can't parse")
                    DispatchQueue.main.async {
                        onError(Throwable("JSON_BODY can't parse"))
                        blocker.free()
                    }
                    return blocker
                }
            } else {
                request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
                request.httpBody = data.percentEscaped().data(using: .utf8)
            }
        }

        // start request
        var dataTask: URLSessionDataTask?
//        let defaultSession = urlSession(for: urlComponent.host!)
        let defaultSession = URLSession(configuration: .default)
                
        dataTask = defaultSession.dataTask(with: request) { data, response, error in
            defer {
                dataTask = nil
            }
            if (error != nil) {
                DispatchQueue.main.async {
                    let message = (data != nil) ? String(data: data!, encoding: .utf8)! : ""
                    self.printLog("response - data:\(message)|error:\(error?.localizedDescription ?? "")")
                    if let response = response as? HTTPURLResponse {
                        onError(
                            HttpErrorReason(statusCode: Int32(response.statusCode), message: message, body: message)
                        )
                    } else {
                        onError(
                            HttpErrorReason(statusCode: Int32(-1), message: "Time out(SDK)", body: "")
                        )
                    }
                    blocker.free()
                }
            } else {
                // call back
                if let response = response as? HTTPURLResponse {
                    let body: String = (data != nil) ? String(data: data!, encoding: .utf8)! : ""
                    DispatchQueue.main.async {
                        // log record
                        onSuccess(
                                RestfulHttpResponse(statusCode: Int32(response.statusCode), body: body)
                        )
                        blocker.free()
                    }
                }
            }
        }

        dataTask?.resume()
        return blocker
    }

    private func printLog(_ log: String) {
        print("[IOSRestfulHttpEngine]:" + log)
    }
}

public class BlockHelper: Waitable {

    var semaphore = DispatchSemaphore(value: 0)

    public override func await() {
        if (Thread.isMainThread) {
            merror("[BlockHelper] refuses to start await() on main thread")
        } else {
            semaphore.wait()
        }
    }

    public func free() {
        semaphore.signal()
    }
}
