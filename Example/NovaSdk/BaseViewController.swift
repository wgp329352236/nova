//
//  Created on 2024/6/19.
//

import UIKit
import NovaSdk
import NovaCore

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        view.backgroundColor = .lightGray
        super.viewDidLoad()
    }
}

func buildButton(_ title: String) -> UIButton {
    UIBuilder.build.buildButton(title)
}

func buildInputView(_ title: String, _ placeholder: String = "") -> (UIView, UITextField) {
    UIBuilder.build.buildInputView(title, placeholder)
}

func buildTextField(_ text: String, _ placeholder: String = "") -> UITextField {
    UIBuilder.build.buildTextField(text, placeholder)
}

let appKeyWindow: UIWindow = {
    if let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
        return window
    }
    if let window = UIApplication.shared.windows.first(where: { ($0.windowLevel == UIWindow.Level(0)) }) {
        return window
    }
    return UIWindow()
}()

func output(_ message: String) {
    mdebug(message)
    Toast(message, 2.5)
}

func Toast(_ message: String, _ afterDelay: TimeInterval) {
    let HUD = MBProgressHUD.showAdded(to: appKeyWindow, animated: true)
    HUD.mode = .text
    HUD.detailsLabel.text = message
    HUD.removeFromSuperViewOnHide = true
    DispatchQueue.main.async {
        HUD.hide(animated: true, afterDelay: afterDelay)
    }
}

enum DemoOrientation {
    case portrait
    case landscape
}

func supportedOrientations() -> DemoOrientation {
    guard let infoDict = Bundle.main.infoDictionary else { return DemoOrientation.portrait}
    if let iPadOrientations = infoDict["UISupportedInterfaceOrientations~ipad"] as? [String] {
        if iPadOrientations.contains("UIInterfaceOrientationLandscapeLeft") || iPadOrientations.contains("UIInterfaceOrientationLandscapeRight") {
            return DemoOrientation.landscape
        }
        return DemoOrientation.portrait
    }
    if let iPhoneOrientations = infoDict["UISupportedInterfaceOrientations"] as? [String] {
        if iPhoneOrientations.contains("UIInterfaceOrientationLandscapeLeft") || iPhoneOrientations.contains("UIInterfaceOrientationLandscapeRight") {
            return DemoOrientation.landscape
        }
        return DemoOrientation.portrait
    }
    return DemoOrientation.portrait
}
