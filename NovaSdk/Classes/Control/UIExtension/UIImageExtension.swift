//
//  Created on 2024/6/21.
//

import Foundation
import UIKit

public enum ImageType {
    case Unknown
    case JPEG
    case PNG
    case GIF
    case TIFF
    case WebP
    case HEIC
    case HEIF
}

private let kFlagsPrefix = "flags/"
private let iPrefix = "i_"

extension UIImage {
    public func getImageType() -> ImageType {
        guard let data = self.pngData() else {
            return .Unknown
        }

        guard data.count > 0 else { return .Unknown }

        var buffer = [UInt8](repeating: 0, count: 1)
        data.copyBytes(to: &buffer, count: 1)

        if buffer.count < 1 { return .Unknown }

        switch buffer {
        case [0xFF]: return .JPEG
        case [0x89]: return .PNG
        case [0x47]: return .GIF
        case [0x49], [0x4D]: return .TIFF
        case [0x52] where data.count >= 12:
            if let str = String(data: data[0...11], encoding: .ascii), str.hasPrefix("RIFF"), str.hasSuffix("WEBP") {
                return .WebP
            }
        case [0x00] where data.count >= 12:
            if let str = String(data: data[8...11], encoding: .ascii) {
                let HEICBitMaps = Set(["heic", "heis", "heix", "hevc", "hevx"])
                if HEICBitMaps.contains(str) {
                    return .HEIC
                }
                let HEIFBitMaps = Set(["mif1", "msf1"])
                if HEIFBitMaps.contains(str) {
                    return .HEIF
                }
            }
        default: break;
        }
        return .Unknown
    }

    private class func findFitPath(_ imageName: String) -> String? {
        let imageRootPath = LocalResource.imagePath

        let pathComponents = imageName.components(separatedBy: ".")
        let pureImageName: String
        var imageExtension: String

        if pathComponents.count > 1 {
            pureImageName = pathComponents.dropLast().joined(separator: ".")
            imageExtension = pathComponents.last!
        } else {
            pureImageName = imageName
            imageExtension = "png" // 默认扩展名
        }

        // 检查是否包含缩放后缀
        let hasScaleSuffix = pureImageName.contains("@1x") || pureImageName.contains("@2x") || pureImageName.contains("@3x")
        if !hasScaleSuffix {
            let screenScale = Int(UIScreen.main.scale)
            let scalesToTry: [Int]

            switch screenScale {
            case 1: scalesToTry = [1, 2, 3]
            case 2: scalesToTry = [2, 3, 1]
            case 3: scalesToTry = [3, 2, 1]
            default: scalesToTry = []
            }

            // 按优先级查找缩放后缀的图片
            for scale in scalesToTry {
                let scaledFileName = "\(pureImageName)@\(scale)x.\(imageExtension)"
                let scaledURL = URL(fileURLWithPath: imageRootPath).appendingPathComponent(scaledFileName)
                let scaledPath = scaledURL.path
                if FileManager.default.fileExists(atPath: scaledPath) {
                    return scaledPath
                }
            }
        }

        // 查找原始名称的图片（带/不带缩放后缀都走这步）
        let originalFileName = "\(pureImageName).\(imageExtension)"
        let originalURL = URL(fileURLWithPath: imageRootPath).appendingPathComponent(originalFileName)
        let originalPath = originalURL.path

        if FileManager.default.fileExists(atPath: originalPath) {
            return originalPath
        }

        merror("This image not exist: '\(pureImageName)'")
        return nil
    }


    class func imageName(name: String) -> UIImage? {
        guard let imagePath = findFitPath(name) else {
            return nil
        }
        return UIImage(contentsOfFile: imagePath)
    }

    class func color(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 3, height: 3)

        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image!.stretchableImage(withLeftCapWidth: 2, topCapHeight: 2)
    }

}

 
