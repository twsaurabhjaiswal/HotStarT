//
//  Extensions.swift
//  HotTV
//
//  Created by Apple on 03/08/23.
//

import Foundation
import SwiftUI
// Remove Separator
//struct RemoveSeparatorModifier: ViewModifier {
//    @ViewBuilder
//    func body(content: Content) -> some View {
//        if #available(iOS 15.0, *) {
//            content
//                .listRowSeparator(.hidden)
//        } else {
//            content
//        }
//    }
//}
extension UIColor {
    static func hexColor(hex: String) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        if cString.count != 6 {
            return UIColor.gray
        }
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
extension UIColor {
    struct CustomColor {
        public static var pink: UIColor {
            return UIColor.hexColor(hex: "#F9F6FD")
        }
    }
}
