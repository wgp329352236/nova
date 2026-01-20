//
//  Created on 2024/6/21.
//

import Foundation

extension BaseAlert {

    @discardableResult
    static func show(_ message: String,
                     _ done: String?,
                     _ cancel: String?,
                     _ callback: @escaping (_ index: NSInteger) -> Void) -> BaseAlert {
        let alert = BaseAlert(title: LocalizedString("prompt", "Prompt"), message: message, preferredStyle: .alert)
        if done != nil {
            alert.done(done!) {
                callback($0)
            }
        }
        if cancel != nil {
            alert.cancel(cancel!) {
                callback($0)
            }
        }
        alert.show()
        return alert
    }

    @discardableResult
    static func show(_ message: String, done: String, _ callback: @escaping (_ index: NSInteger) -> Void) -> BaseAlert {
        let alert = BaseAlert(title: LocalizedString("prompt", "Prompt"), message: message, preferredStyle: .alert)
        alert.done(done) {
            callback($0)
        }
        alert.show()
        return alert
    }

    @discardableResult
    static func show(_ message: String,
                     cancel: String,
                     _ callback: @escaping (_ index: NSInteger) -> Void
    ) -> BaseAlert {
        let alert = BaseAlert(title: LocalizedString("prompt", "Prompt"), message: message, preferredStyle: .alert)
        alert.cancel(cancel) {
            callback($0)
        }
        alert.show()
        return alert
    }
}

class BaseAlert: UIAlertController {

    private var actionIndex: NSInteger = 0

    func done(_ title: String = LocalizedString("ok", "OK"),
              _ callback: @escaping (_ index: NSInteger) -> Void
    ) {
        actionIndex += 1
        let done = UIAlertAction(title: title, style: .default) { _ in
            DispatchQueue.main.async { [self] in
                callback(actionIndex)
            }
        }
        self.addAction(done)
    }

    func cancel(_ title: String = LocalizedString("cancel", "Cancel"),
                _ callback: @escaping (_ index: NSInteger) -> Void
    ) {
        let cancel = UIAlertAction(title: title, style: .cancel) { _ in
            DispatchQueue.main.async {
                callback(0)
            }
        }
        self.addAction(cancel)
    }

    func addAction(_ title: String?,
                   _ style: UIAlertAction.Style,
                   _ handler: ((UIAlertAction) -> Void)? = nil
    ) {
        self.addAction(UIAlertAction(title: title, style: style, handler: handler))
    }

    func show() {
        appTopViewController.present(self, animated: true)
    }

}
