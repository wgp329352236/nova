//
//  Created on 2024/6/21.
//

import Foundation

enum BaseTextViewType {
    case normal
    case attributed
}

class BaseTextView: UITextView, UITextViewDelegate {

    private var linkBlock: (_ link: String) -> Void = { _ in
    }
    var type: BaseTextViewType

    init(_ type: BaseTextViewType) {
        self.type = type
        super.init(frame: .zero, textContainer: nil)
        backgroundColor = .clear
        if type == .attributed {
            isEditable = false
            textAlignment = .center
            font = .font28
        }
        textContainer.lineFragmentPadding = 0
        textContainerInset = .zero
        contentInset = .zero
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /**
     * link attribute
     * [k,v], k = String, v = link eg: [title:limits, scheme:limits, link:http://www.baidu.com/]
     *
     */

    var linksInfo: Array<Dictionary<String, String>> = []

    func addLink(_ linksInfo: Array<Dictionary<String, String>>, _ block: @escaping (_ link: String) -> Void) {
        if text == nil {
            return
        }

        delegate = self
        restrictDoubleTapAndLongPress()

        linkBlock = block
        self.linksInfo = linksInfo

        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.dynamicColor(gameTheme.descriptionTitle.textColor),
                          NSAttributedString.Key.font: font as Any]
        let attributedText = NSMutableAttributedString(string: text!, attributes: attributes)

        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = textAlignment
        paragraph.lineBreakMode = .byWordWrapping
        attributedText.addAttributes(
                [NSAttributedString.Key.paragraphStyle: paragraph],
                range: NSRange(location: 0, length: attributedText.length)
        )

        linksInfo.forEach { (linkInfo) in
            if let title = linkInfo["title"], let scheme = linkInfo["scheme"] {
                let range = (self.text as NSString).range(of: title)
                attributedText.addAttributes(
                        [NSAttributedString.Key.foregroundColor: UIColor.dynamicColor(gameTheme.textButton.textColor),
                         NSAttributedString.Key.link: scheme],
                        range: range)
            }
        }

        linkTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.dynamicColor(gameTheme.textButton.textColor)]

        self.attributedText = attributedText
        sizeToFit()
    }

    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        if let urlScheme = URL.scheme {
            for linkInfo in linksInfo {
                if let linkScheme = linkInfo["scheme"] {
                    if linkScheme.hasPrefix(urlScheme) {
                        linkBlock(linkInfo["link"]!)
                        return false
                    }
                }
            }
        }
        return true
    }

    func restrictDoubleTapAndLongPress() {
        isEditable = false
        isScrollEnabled = false

        guard let touches = gestureRecognizers else {
            return
        }

        var validTouches: [UIGestureRecognizer] = []
        touches.forEach { (touch) in
            if touch is UITapGestureRecognizer {
                if touch.numberOfTouches == 1 {
                    validTouches.append(touch)
                }
            } else if touch is UILongPressGestureRecognizer {
                if (touch as! UILongPressGestureRecognizer).minimumPressDuration < 0.3 {
                    validTouches.append(touch)
                }
            } else {
//                validTouches.append(touch)
            }
        }
    }


}

