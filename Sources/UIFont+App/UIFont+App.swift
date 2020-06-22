//
//  UIFont+App.swift
//  CocoaUI
//
//  Created by Prashant Shrestha on 5/18/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit
import DeviceX

public extension UIFont {
    struct FontSize {
        public static var veryLarge: CGFloat {
            switch UIDevice.deviceSize {
            case .screen4Inches:
                return 28
            case .screen4Dot7Inches, .screen5Dot5Inches:
                return 35
            case .screen5Dot8Inches, .screen6Dot1Inches, .screen6Dot5Inches:
                return 40
            default:
                return 40
            }
        }
        public static var  large: CGFloat {
            switch UIDevice.deviceSize {
            case .screen4Inches:
                return 22
            case .screen4Dot7Inches, .screen5Dot5Inches:
                return 24
            case .screen5Dot8Inches, .screen6Dot1Inches, .screen6Dot5Inches:
                return 26
            default:
                return 26
            }
        }
        public static var mediumLarge: CGFloat {
            switch UIDevice.deviceSize {
            case .screen4Inches:
                return 17
            case .screen4Dot7Inches, .screen5Dot5Inches:
                return 19
            case .screen5Dot8Inches, .screen6Dot1Inches, .screen6Dot5Inches:
                return 20
            default:
                return 20
            }
        }
        public static var  regular: CGFloat {
            switch UIDevice.deviceSize {
            case .screen4Inches:
                return 15
            case .screen4Dot7Inches, .screen5Dot5Inches:
                return 17
            case .screen5Dot8Inches, .screen6Dot1Inches, .screen6Dot5Inches:
                return 17
            default:
                return 17
            }
        }
        public static var mediumSmall: CGFloat {
            switch UIDevice.deviceSize {
            case .screen4Inches:
                return 14
            case .screen4Dot7Inches, .screen5Dot5Inches:
                return 16
            case .screen5Dot8Inches, .screen6Dot1Inches, .screen6Dot5Inches:
                return 16
            default:
                return 16
            }
        }
        public static var small: CGFloat {
            switch UIDevice.deviceSize {
            case .screen4Inches:
                return 13
            case .screen4Dot7Inches, .screen5Dot5Inches:
                return 14
            case .screen5Dot8Inches, .screen6Dot1Inches, .screen6Dot5Inches:
                return 14
            default:
                return 14
            }
        }
        public static var verySmall: CGFloat {
            switch UIDevice.deviceSize {
            case .screen4Inches:
                return 10
            case .screen4Dot7Inches, .screen5Dot5Inches:
                return 12
            case .screen5Dot8Inches, .screen6Dot1Inches, .screen6Dot5Inches:
                return 12
            default:
                return 12
            }
        }
    }
    
    private class var bold: String {
        return "\(UIFont.defaultFontFamily)-Bold"
    }
    
    private class var semiBold: String {
        return "\(UIFont.defaultFontFamily)-SemiBold"
    }
    
    private class var medium: String {
        return "\(UIFont.defaultFontFamily)-Medium"
    }
    
    private class var regular: String {
        return "\(UIFont.defaultFontFamily)"
    }
    
    private class var light: String {
        return "\(UIFont.defaultFontFamily)-Light"
    }
    
    private class var ultraLight: String {
        return "\(UIFont.defaultFontFamily)-UltraLight"
    }
    private class var thin: String {
        return "\(UIFont.defaultFontFamily)-Thin"
    }
    
    class var defaultFontFamily: String {
        return UserDefaults.standard.string(forKey: "defaultFontFamily") ?? "HelveticaNeue"
    }
    
    class func setDefaultFontFamily(_ familyName: String) {
        UserDefaults.standard.set(familyName, forKey: "defaultFontFamily")
    }
    
    class var veryLargeBold: UIFont {
        return UIFont(name: bold, size: FontSize.veryLarge) ?? UIFont.systemFont(ofSize: FontSize.veryLarge, weight: .bold)
    }
    
    class var veryLargeLight: UIFont {
        return UIFont(name: light, size: FontSize.veryLarge) ?? UIFont.systemFont(ofSize: FontSize.veryLarge, weight: .light)
    }
    
    class var veryLargeUltraLight: UIFont {
        return UIFont(name: ultraLight, size: FontSize.veryLarge) ?? UIFont.systemFont(ofSize: FontSize.veryLarge, weight: .ultraLight)
    }
    
    class var largeBold: UIFont {
        return UIFont(name: bold, size: FontSize.large) ?? UIFont.systemFont(ofSize: FontSize.large, weight: .bold)
    }
    
    class var largeMedium: UIFont {
        return UIFont(name: medium, size: FontSize.large) ?? UIFont.systemFont(ofSize: FontSize.large, weight: .medium)
    }
    
    class var largeRegular: UIFont {
        return UIFont(name: regular, size: FontSize.large) ?? UIFont.systemFont(ofSize: FontSize.large, weight: .regular)
    }
    
    class var largeLight: UIFont {
        return UIFont(name: light, size: FontSize.large) ?? UIFont.systemFont(ofSize: FontSize.large, weight: .light)
    }
    
    class var mediumLargeBold: UIFont {
        return UIFont(name: bold, size: FontSize.mediumLarge) ?? UIFont.systemFont(ofSize: FontSize.mediumLarge, weight: .bold)
    }
    
    class var mediumLargeMedium: UIFont {
        return UIFont(name: medium, size: FontSize.mediumLarge) ?? UIFont.systemFont(ofSize: FontSize.mediumLarge, weight: .medium)
    }
    
    class var mediumLargeRegular: UIFont {
        return UIFont(name: regular, size: FontSize.mediumLarge) ?? UIFont.systemFont(ofSize: FontSize.mediumLarge, weight: .regular)
    }
    
    class var mediumLargeThin: UIFont {
        return UIFont(name: thin, size: FontSize.mediumLarge) ?? UIFont.systemFont(ofSize: FontSize.mediumLarge, weight: .thin)
    }
    
    class var mediumLargeLight: UIFont {
        return UIFont(name: light, size: FontSize.mediumLarge) ?? UIFont.systemFont(ofSize: FontSize.mediumLarge, weight: .light)
    }
    
    class var regularBold: UIFont {
        return UIFont(name: bold, size: FontSize.regular) ?? UIFont.systemFont(ofSize: FontSize.regular, weight: .bold)
    }
    
    class var regularSemiBold: UIFont {
        return UIFont(name: bold, size: FontSize.regular) ?? UIFont.systemFont(ofSize: FontSize.regular, weight: .semibold)
    }
    
    class var regularMedium: UIFont {
        return UIFont(name: medium, size: FontSize.regular) ?? UIFont.systemFont(ofSize: FontSize.regular, weight: .medium)
    }
    
    class var regularRegular: UIFont {
        return UIFont(name: regular, size: FontSize.regular) ?? UIFont.systemFont(ofSize: FontSize.regular, weight: .regular)
    }
    
    class var regularLight: UIFont {
        return UIFont(name: light, size: FontSize.regular) ?? UIFont.systemFont(ofSize: FontSize.regular, weight: .light)
    }
    
    class var mediumSmallBold: UIFont {
        return UIFont(name: bold, size: FontSize.mediumSmall) ?? UIFont.systemFont(ofSize: FontSize.mediumSmall, weight: .bold)
    }
    
    class var mediumSmallMedium: UIFont {
        return UIFont(name: medium, size: FontSize.mediumSmall) ?? UIFont.systemFont(ofSize: FontSize.mediumSmall, weight: .medium)
    }
    
    class var mediumSmallRegular: UIFont {
        return UIFont(name: regular, size: FontSize.mediumSmall) ?? UIFont.systemFont(ofSize: FontSize.mediumSmall, weight: .regular)
    }
    
    class var mediumSmallLight: UIFont {
        return UIFont(name: light, size: FontSize.mediumSmall) ?? UIFont.systemFont(ofSize: FontSize.mediumSmall, weight: .light)
    }
    
    class var mediumSmallThin: UIFont {
        return UIFont(name: thin, size: FontSize.mediumSmall) ?? UIFont.systemFont(ofSize: FontSize.mediumSmall, weight: .thin)
    }
    
    class var smallMedium: UIFont {
        return UIFont(name: medium, size: FontSize.small) ?? UIFont.systemFont(ofSize: FontSize.small, weight: .medium)
    }
    
    class var smallRegular: UIFont {
        return UIFont(name: regular, size: FontSize.small) ?? UIFont.systemFont(ofSize: FontSize.small, weight: .regular)
    }
    
    class var smallBold: UIFont {
        return UIFont(name: bold, size: FontSize.small) ?? UIFont.systemFont(ofSize: FontSize.small, weight: .bold)
    }
    
    class var smallSemiBold: UIFont {
        return UIFont(name: semiBold, size: FontSize.small) ?? UIFont.systemFont(ofSize: FontSize.small, weight: .semibold)
    }
    
    class var smallLight: UIFont {
        return UIFont(name: light, size: FontSize.small) ?? UIFont.systemFont(ofSize: FontSize.small, weight: .light)
    }
    
    class var smallThin: UIFont {
        return UIFont(name: thin, size: FontSize.small) ?? UIFont.systemFont(ofSize: FontSize.small, weight: .thin)
    }
    
    class var verySmallBold: UIFont {
        return UIFont(name: bold, size: FontSize.verySmall) ?? UIFont.systemFont(ofSize: FontSize.verySmall, weight: .bold)
    }
    
    class var verySmallMedium: UIFont {
        return UIFont(name: medium, size: FontSize.verySmall) ?? UIFont.systemFont(ofSize: FontSize.verySmall, weight: .medium)
    }
    
    class var verySmallRegular: UIFont {
        return UIFont(name: regular, size: FontSize.verySmall) ?? UIFont.systemFont(ofSize: FontSize.verySmall, weight: .regular)
    }
    
    class var verySmallLight: UIFont {
        return UIFont(name: light, size: FontSize.verySmall) ?? UIFont.systemFont(ofSize: FontSize.verySmall, weight: .light)
    }
    
}

// MARK: All Fonts

extension UIFont {
    
    static func allSystemFontsNames() -> [String] {
        var fontsNames = [String]()
        let fontFamilies = UIFont.familyNames
        for fontFamily in fontFamilies {
            let fontsForFamily = UIFont.fontNames(forFamilyName: fontFamily)
            for fontName in fontsForFamily {
                fontsNames.append(fontName)
            }
        }
        return fontsNames
    }
}

// MARK: Randomizing Fonts

extension UIFont {
    
    static func randomFont(ofSize size: CGFloat) -> UIFont {
        let allFontsNames = UIFont.allSystemFontsNames()
        let fontsCount = UInt32(allFontsNames.count)
        let randomFontIndex = Int(arc4random_uniform(fontsCount))
        let randomFontName = allFontsNames[randomFontIndex]
        return UIFont(name: randomFontName, size: size)!
    }
}
