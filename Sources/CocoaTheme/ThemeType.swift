//
//  ThemeType.swift
//  CocoaUI
//
//  Created by Prashant Shrestha on 5/18/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit

public enum ColorThemeType {
    case primary, secondary, tertiary
    
    static let allValues = [primary, secondary, tertiary]
}

public enum ThemeType {
    case light(primary: UIColor?, primaryLight: UIColor?, primaryDark: UIColor?, secondary: UIColor?, secondaryLight: UIColor?, secondaryDark: UIColor?, tertiary: UIColor?)
    case dark(primary: UIColor?, primaryLight: UIColor?, primaryDark: UIColor?, secondary: UIColor?, secondaryLight: UIColor?, secondaryDark: UIColor?, tertiary: UIColor?)
    
    public var associatedObject: Theme {
        switch self {
        case .light(let primary, let primaryLight, let primaryDark, let secondary, let secondaryLight, let secondaryDark, let tertiary):
            return LightTheme(primary: primary, primaryLight: primaryLight, primaryDark: primaryDark, secondary: secondary, secondaryLight: secondaryLight, secondaryDark: secondaryDark, tertiary: tertiary)
        case .dark(let primary, let primaryLight, let primaryDark, let secondary, let secondaryLight, let secondaryDark, let tertiary):
            return DarkTheme(primary: primary, primaryLight: primaryLight, primaryDark: primaryDark, secondary: secondary, secondaryLight: secondaryLight, secondaryDark: secondaryDark, tertiary: tertiary)
        }
    }
    
    var isDark: Bool {
        switch self {
        case .dark: return true
        default: return false
        }
    }
    
    public func toggled() {
        var theme: ThemeType
        let defaults = UserDefaults.standard
        switch self {
        case .light:
            let primary = defaults.string(forKey: "dark_primary").map({ UIColor(hexString: $0) }) ?? nil
            let primaryLight = defaults.string(forKey: "dark_primaryLight").map({ UIColor(hexString: $0) }) ?? nil
            let primaryDark = defaults.string(forKey: "dark_primaryDark").map({ UIColor(hexString: $0) }) ?? nil
            let secondary = defaults.string(forKey: "dark_secondary").map({ UIColor(hexString: $0) }) ?? nil
            let secondaryLight = defaults.string(forKey: "dark_secondaryLight").map({ UIColor(hexString: $0) }) ?? nil
            let secondaryDark = defaults.string(forKey: "dark_secondaryDark").map({ UIColor(hexString: $0) }) ?? nil
            let tertiary = defaults.string(forKey: "dark_tertiary").map({ UIColor(hexString: $0) }) ?? nil
            theme = ThemeType.dark(primary: primary, primaryLight: primaryLight, primaryDark: primaryDark, secondary: secondary, secondaryLight: secondaryLight, secondaryDark: secondaryDark, tertiary: tertiary)
        case .dark:
            let primary = defaults.string(forKey: "light_primary").map({ UIColor(hexString: $0) }) ?? nil
            let primaryLight = defaults.string(forKey: "light_primaryLight").map({ UIColor(hexString: $0) }) ?? nil
            let primaryDark = defaults.string(forKey: "light_primaryDark").map({ UIColor(hexString: $0) }) ?? nil
            let secondary = defaults.string(forKey: "light_secondary").map({ UIColor(hexString: $0) }) ?? nil
            let secondaryLight = defaults.string(forKey: "light_secondaryLight").map({ UIColor(hexString: $0) }) ?? nil
            let secondaryDark = defaults.string(forKey: "light_secondaryDark").map({ UIColor(hexString: $0) }) ?? nil
            let tertiary = defaults.string(forKey: "light_tertiary").map({ UIColor(hexString: $0) }) ?? nil
            theme = ThemeType.light(primary: primary, primaryLight: primaryLight, primaryDark: primaryDark, secondary: secondary, secondaryLight: secondaryLight, secondaryDark: secondaryDark, tertiary: tertiary)
        }
        theme.save()
    }
}

extension ThemeType {
    public static func currentTheme() -> ThemeType {
        let defaults = UserDefaults.standard
        let isDark = defaults.bool(forKey: "IsDarkKey")
        let colorKey = isDark ? "dark" : "light"
        let primary = defaults.string(forKey: "\(colorKey)_primary").map({ UIColor(hexString: $0) }) ?? nil
        let primaryLight = defaults.string(forKey: "\(colorKey)_primaryLight").map({ UIColor(hexString: $0) }) ?? nil
        let primaryDark = defaults.string(forKey: "\(colorKey)_primaryDark").map({ UIColor(hexString: $0) }) ?? nil
        let secondary = defaults.string(forKey: "\(colorKey)_secondary").map({ UIColor(hexString: $0) }) ?? nil
        let secondaryLight = defaults.string(forKey: "\(colorKey)_secondaryLight").map({ UIColor(hexString: $0) }) ?? nil
        let secondaryDark = defaults.string(forKey: "\(colorKey)_secondaryDark").map({ UIColor(hexString: $0) }) ?? nil
        let tertiary = defaults.string(forKey: "\(colorKey)_tertiary").map({ UIColor(hexString: $0) }) ?? nil
        let theme = isDark ? ThemeType.dark(primary: primary, primaryLight: primaryLight, primaryDark: primaryDark, secondary: secondary, secondaryLight: secondaryLight, secondaryDark: secondaryDark, tertiary: tertiary) : ThemeType.light(primary: primary, primaryLight: primaryLight, primaryDark: primaryDark, secondary: secondary, secondaryLight: secondaryLight, secondaryDark: secondaryDark, tertiary: tertiary)
        return theme
    }
    
    public static func defaultTheme() {
        let defaults = UserDefaults.standard
        let isDark = defaults.bool(forKey: "IsDarkKey")
        defaults.set(nil, forKey: "light_primary")
        defaults.set(nil, forKey: "light_primaryLight")
        defaults.set(nil, forKey: "light_primaryDark")
        defaults.set(nil, forKey: "light_secondary")
        defaults.set(nil, forKey: "light_secondaryLight")
        defaults.set(nil, forKey: "light_secondaryDark")
        defaults.set(nil, forKey: "light_tertiary")
        defaults.set(nil, forKey: "dark_primary")
        defaults.set(nil, forKey: "dark_primaryLight")
        defaults.set(nil, forKey: "dark_primaryDark")
        defaults.set(nil, forKey: "dark_secondary")
        defaults.set(nil, forKey: "dark_secondaryLight")
        defaults.set(nil, forKey: "dark_secondaryDark")
        defaults.set(nil, forKey: "dark_tertiary")
        let theme = isDark ? ThemeType.dark(primary: nil, primaryLight: nil, primaryDark: nil, secondary: nil, secondaryLight: nil, secondaryDark: nil, tertiary: nil) : ThemeType.light(primary: nil, primaryLight: nil, primaryDark: nil, secondary: nil, secondaryLight: nil, secondaryDark: nil, tertiary: nil)
        theme.save()
    }
    
    public static func setLightThemeColor(primary: UIColor, primaryLight: UIColor, primaryDark: UIColor, secondary: UIColor, secondaryLight: UIColor, secondaryDark: UIColor, tertiary: UIColor) {
        let defaults = UserDefaults.standard
        defaults.set(primary.hexString, forKey: "light_primary")
        defaults.set(primaryLight.hexString, forKey: "light_primaryLight")
        defaults.set(primaryDark.hexString, forKey: "light_primaryDark")
        defaults.set(secondary.hexString, forKey: "light_secondary")
        defaults.set(secondaryLight.hexString, forKey: "light_secondaryLight")
        defaults.set(secondaryDark.hexString, forKey: "light_secondaryDark")
        defaults.set(tertiary.hexString, forKey: "light_tertiary")
    }
    
    public static func setDarkThemeColor(primary: UIColor, primaryLight: UIColor, primaryDark: UIColor, secondary: UIColor, secondaryLight: UIColor, secondaryDark: UIColor, tertiary: UIColor) {
        let defaults = UserDefaults.standard
        defaults.set(primary.hexString, forKey: "dark_primary")
        defaults.set(primaryLight.hexString, forKey: "dark_primaryLight")
        defaults.set(primaryDark.hexString, forKey: "dark_primaryDark")
        defaults.set(secondary.hexString, forKey: "dark_secondary")
        defaults.set(secondaryLight.hexString, forKey: "dark_secondaryLight")
        defaults.set(secondaryDark.hexString, forKey: "dark_secondaryDark")
        defaults.set(tertiary.hexString, forKey: "dark_tertiary")
    }
    
    func save() {
        let defaults = UserDefaults.standard
        defaults.set(self.isDark, forKey: "IsDarkKey")
        NotificationCenter.default.post(name: .themeToggled, object: self)
    }
}


fileprivate extension UIColor {
    var hexString: String {
        let components: [Int] = {
            let comps = cgColor.components!
            let components = comps.count == 4 ? comps : [comps[0], comps[0], comps[0], comps[1]]
            return components.map { Int($0 * 255.0) }
        }()
        return String(format: "#%02X%02X%02X", components[0], components[1], components[2])
    }
    
    /// Create Color from hexadecimal string with optional transparency (if applicable).
    ///
    /// - Parameters:
    ///   - hexString: hexadecimal string (examples: EDE7F6, 0xEDE7F6, #EDE7F6, #0ff, 0xF0F, ..).
    ///   - transparency: optional transparency value (default is 1).
    convenience init?(hexString: String, transparency: CGFloat = 1) {
        var string = ""
        if hexString.lowercased().hasPrefix("0x") {
            string =  hexString.replacingOccurrences(of: "0x", with: "")
        } else if hexString.hasPrefix("#") {
            string = hexString.replacingOccurrences(of: "#", with: "")
        } else {
            string = hexString
        }

        if string.count == 3 { // convert hex to 6 digit format if in short format
            var str = ""
            string.forEach { str.append(String(repeating: String($0), count: 2)) }
            string = str
        }

        guard let hexValue = Int(string, radix: 16) else { return nil }

        var trans = transparency
        if trans < 0 { trans = 0 }
        if trans > 1 { trans = 1 }

        let red = CGFloat((hexValue >> 16) & 0xff)
        let green = CGFloat((hexValue >> 8) & 0xff)
        let blue = CGFloat(hexValue & 0xff)
        self.init(red: red, green: green, blue: blue, alpha: transparency)
    }
}
