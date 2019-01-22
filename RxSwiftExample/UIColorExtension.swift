//
//  UIColorExtension.swift
//  RxSwiftExample
//
//  Created by LvjuWang on 2019/1/22.
//  Copyright © 2019 ljwang. All rights reserved.
//
import UIKit
extension UIColor {
    struct RxSwiftExample {
        static var orange: UIColor { return UIColor(hexString: "#F5A623") }
        static var lightOrange: UIColor { return UIColor(hexString: "#F5B342") }
        static var gray: UIColor { return UIColor(hexString: "#DEDFE1") }
        static var yellow: UIColor { return UIColor(hexString: "#D7BB71") }
        static var grayYellow: UIColor { return UIColor(hexString: "#D7BB71", alpha: 0.6) }
        static var orangeGray: UIColor { return UIColor(hexString: "#8E7C5F") }
        static var darkGray: UIColor { return UIColor(hexString: "#64646A", alpha: 0.4) }
        static var shadowDark: UIColor { return UIColor(hexString: "#E2E2E8", alpha: 0.4) }
        static var tabGray: UIColor { return UIColor(hexString: "#919191") }
        static var backgroundGray: UIColor { return UIColor(hexString: "#F6F6F6")}
        static var black: UIColor { return UIColor(hexString: "#333333")}
        static var A2black: UIColor { return UIColor(hexString: "#333333", alpha: 0.2)}
        static var A3black: UIColor { return UIColor(hexString: "#333333", alpha: 0.3)}
        static var A4white: UIColor { return UIColor(hexString: "#FFFFFF", alpha: 0.4)}
        static var A8white: UIColor { return UIColor(hexString: "#FFFFFF", alpha: 0.8)}
        static var A5gGrayForDetailt: UIColor { return UIColor(hexString: "#8A8383", alpha: 0.5)}
        static var A2GrayForDetailt: UIColor { return UIColor(hexString: "#8A8383", alpha: 0.2)}
        static var GrayForTitle: UIColor { return UIColor(hexString: "#64646A")}
        static var red: UIColor { return UIColor(hexString: "#ED4014") }
        static var A3darkGray: UIColor { return UIColor(hexString: "#64646A", alpha: 0.3) }
        static var NavigationColor = UIColor(red: (247/255), green: (247/255), blue: (247/255), alpha: 1)
        static var MapOrage: UIColor { return UIColor(hexString: "#FA9D03") }
        static var A2MapOrage: UIColor { return UIColor(hexString: "#FA9D03", alpha: 0.2) }
        static var TableViewBackgroud: UIColor { return UIColor(hexString: "#F8F8F8") }
        static var A4MapShadow: UIColor { return UIColor(hexString: "#A15000", alpha: 0.4) }
        static var A3MapShadow: UIColor { return UIColor(hexString: "#000000", alpha: 0.3) }
        static var A1MapShadow: UIColor { return UIColor(hexString: "#000000", alpha: 0.1) }
        static var lightGray: UIColor { return UIColor(hexString: "#B3B7BE") }
        static var darkOrange: UIColor { return UIColor(hexString: "#FB8306") }
        static var lightGreen: UIColor { return UIColor(hexString: "#F1F9F6") }
        static var green: UIColor { return UIColor(hexString: "#5CBA6E") }
        static var tagOrange: UIColor { return UIColor(hexString: "#FDF8F1") }
        static var oilCodeGray: UIColor { return UIColor(hexString: "#4E516C") }
        static var borderGray: UIColor { return UIColor(hexString: "#E8E9EB") }
        static var separatorGray: UIColor { return UIColor(hexString: "#F6F6F6") }
        static var homeLightGlod: UIColor { return UIColor(hexString: "#E1CF9E") }
        static var alertShadowBlack: UIColor { return UIColor(hexString: "#000000", alpha: 0.5) }
    }
    
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let rInt = Int(color >> 16) & mask
        let gInt = Int(color >> 8) & mask
        let bInt = Int(color) & mask
        let red   = CGFloat(rInt) / 255.0
        let green = CGFloat(gInt) / 255.0
        let blue  = CGFloat(bInt) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
}
