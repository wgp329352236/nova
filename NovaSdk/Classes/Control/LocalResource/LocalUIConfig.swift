//
//  Created on 2024/6/22.
//

import Foundation
import HandyJSON

class LocalUIConfig: HandyJSON {

    var sdk_main_bg_color: String = "0xF1F4FB"
    var sdk_line_color: String = "0xC9D4E9"

    public static let shared: LocalUIConfig = {
        if sdkLocalConfigData != nil {
            let configFile = NSDictionary(contentsOfFile: LocalResource.uiConfigFile())
            return LocalUIConfig.deserialize(from: configFile)!
        }
        return LocalUIConfig()
    }()

    private static func matchConfig(_ type: String) -> NSDictionary? {
        if sdkLocalConfigData != nil {
            if let configFile = NSDictionary(contentsOfFile: LocalResource.uiConfigFile()) {
                let data = configFile[type] as! NSDictionary
                return data
            }
        }
        return nil
    }

    public static let navigationBar: NavigationBarConfig = {
        guard let data = matchConfig("sdk_nav_bar") else {
            return NavigationBarConfig()
        }
        return NavigationBarConfig.deserialize(from: data)!
    }()

    public static let button: ButtonConfig = {
        guard let data = matchConfig("sdk_button") else {
            return ButtonConfig()
        }
        return ButtonConfig.deserialize(from: data)!
    }()

    public static let sendcode: SendCodeButtonConfig = {
        guard let data = matchConfig("sdk_send_button") else {
            return SendCodeButtonConfig()
        }
        return SendCodeButtonConfig.deserialize(from: data)!
    }()

    public static let textField: TextFieldConfig = {
        guard let data = matchConfig("sdk_textfield") else {
            return TextFieldConfig()
        }
        return TextFieldConfig.deserialize(from: data)!
    }()

    public static let attribute: AttributeConfig = {
        guard let data = matchConfig("sdk_attribute") else {
            return AttributeConfig()
        }
        return AttributeConfig.deserialize(from: data)!
    }()

    public static let label: LabelConfig = {
        guard let data = matchConfig("sdk_label") else {
            return LabelConfig()
        }
        return LabelConfig.deserialize(from: data)!
    }()

    public static let badge: BadgeConfig = {
        guard let data = matchConfig("sdk_badge") else {
            return BadgeConfig()
        }
        return BadgeConfig.deserialize(from: data)!
    }()

    required init() {
    }
}


class NavigationBarConfig: HandyJSON {
    var title_font: String = "32"
    var title_color: String = "0xffffff"
    var bg_color: String = "0x0183d5"
    var back_text_color: String = "0xffffff"
    var back_text_font: String = "32"

    required init() {
    }
}

class ButtonConfig: HandyJSON {
    var text_font: String?
    var text_color_normal: String = "0xffffff"
    var text_color_highlighted: String = "0xffffff"
    var text_color_selected: String = "0x57a034"
    var text_color_disable: String?
    var bg_color_normal: String = "0x0A94BB"
    var bg_color_highlighted: String = "0x4db8fb"
    var bg_color_selected: String = "0x1c93df"
    var bg_color_disable: String = "0xbdbdbd"

    required init() {
    }
}

class TextFieldConfig: HandyJSON {
    var text_font: String = "28"
    var text_color: String = "0x212121"
    var placeholder_color: String = "0x666666"
    var bg_color: String?
    var border_color_normal: String = "0x8e8e8e"
    var border_color_selected: String = "0x4db8fb"
    var border_color_disabled: String = "0xb9b9b9"
    var disabled_color: String = "0xc7c7c7"

    required init() {
    }
}


class SendCodeButtonConfig: HandyJSON {
    var text_color_normal: String = "0x0A94BB"
    var text_color_highlighted: String = "0x000000"
    var text_font: String?
    var bg_color_normal: String = "0x4db8fb"
    var bg_color_highlighted: String = "0x1c93df"
    var bg_color_selected: String = "0x8ac6ec"
    var bg_color_disable: String = "0xbdbdbd"

    required init() {
    }
}

class AttributeConfig: HandyJSON {
    var text_color: String = "0x000000"
    var highlighted_color: String = "0x000000"

    required init() {
    }
}

class LabelConfig: HandyJSON {
    var text_color: String = "0x212121"
    var bg_color: String?

    required init() {
    }
}

class BadgeConfig: HandyJSON {
    var text_color: String = "0xffffff"
    var bg_color: String = "0xF56C6C"

    required init() {
    }
}

