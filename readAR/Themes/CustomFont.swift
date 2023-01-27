//
//  CustomFont.swift
//  readAR
//
//  Created by Zidan Ramadhan on 24/01/23.
//

import UIKit


extension UIFont {

    public enum SFProDisplayType: String {
        case heavy = " Heavy"
        case light = " Light"
        case semibold = " Semibold"
    }

    static func SFProDisplay(_ type: SFProDisplayType = .semibold, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: "SF Pro Display\(type.rawValue)", size: size)!
    }

    var isBold: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitBold)
    }

    var isItalic: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitItalic)
    }

}
