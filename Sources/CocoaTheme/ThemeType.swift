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
    case light(primary: UIColor?, primaryLight: UIColor?, primaryDark: UIColor?, secondary: UIColor?, secondaryLight: UIColor?, secondaryDark: UIColor?, tertiary: UIColor?, text: UIColor? = nil, textLight: UIColor? = nil, textDark: UIColor? = nil, textError: UIColor? = nil, background: UIColor? = nil, backgroundLight: UIColor? = nil, backgroundDark: UIColor? = nil)
    case dark(primary: UIColor?, primaryLight: UIColor?, primaryDark: UIColor?, secondary: UIColor?, secondaryLight: UIColor?, secondaryDark: UIColor?, tertiary: UIColor?, text: UIColor? = nil, textLight: UIColor? = nil, textDark: UIColor? = nil, textError: UIColor? = nil, background: UIColor? = nil, backgroundLight: UIColor? = nil, backgroundDark: UIColor? = nil)
    
    public var associatedObject: Theme {
        switch self {
        case .light(let primary, let primaryLight, let primaryDark, let secondary, let secondaryLight, let secondaryDark, let tertiary, let text, let textLight, let textDark, let textError, let background, let backgroundLight, let backgroundDark):
            return LightTheme(primary: primary, primaryLight: primaryLight, primaryDark: primaryDark, secondary: secondary, secondaryLight: secondaryLight, secondaryDark: secondaryDark, tertiary: tertiary, text: text, textLight: textLight, textDark: textDark, textError: textError, background: background, backgroundLight: backgroundLight, backgroundDark: backgroundDark)
        case .dark(let primary, let primaryLight, let primaryDark, let secondary, let secondaryLight, let secondaryDark, let tertiary, let text, let textLight, let textDark, let textError, let background, let backgroundLight, let backgroundDark):
            return DarkTheme(primary: primary, primaryLight: primaryLight, primaryDark: primaryDark, secondary: secondary, secondaryLight: secondaryLight, secondaryDark: secondaryDark, tertiary: tertiary, text: text, textLight: textLight, textDark: textDark, textError: textError, background: background, backgroundLight: backgroundLight, backgroundDark: backgroundDark)
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
            let text = defaults.string(forKey: "dark_text").map({ UIColor(hexString: $0) }) ?? nil
            let textLight = defaults.string(forKey: "dark_textLight").map({ UIColor(hexString: $0) }) ?? nil
            let textDark = defaults.string(forKey: "dark_textDark").map({ UIColor(hexString: $0) }) ?? nil
            let textError = defaults.string(forKey: "dark_textError").map({ UIColor(hexString: $0) }) ?? nil
            let background = defaults.string(forKey: "dark_background").map({ UIColor(hexString: $0) }) ?? nil
            let backgroundLight = defaults.string(forKey: "dark_backgroundLight").map({ UIColor(hexString: $0) }) ?? nil
            let backgroundDark = defaults.string(forKey: "dark_backgroundDark").map({ UIColor(hexString: $0) }) ?? nil
            theme = ThemeType.dark(primary: primary, primaryLight: primaryLight, primaryDark: primaryDark, secondary: secondary, secondaryLight: secondaryLight, secondaryDark: secondaryDark, tertiary: tertiary,text: text, textLight: textLight, textDark: textDark, textError: textError, background: background, backgroundLight: backgroundLight, backgroundDark: backgroundDark)
        case .dark:
            let primary = defaults.string(forKey: "light_primary").map({ UIColor(hexString: $0) }) ?? nil
            let primaryLight = defaults.string(forKey: "light_primaryLight").map({ UIColor(hexString: $0) }) ?? nil
            let primaryDark = defaults.string(forKey: "light_primaryDark").map({ UIColor(hexString: $0) }) ?? nil
            let secondary = defaults.string(forKey: "light_secondary").map({ UIColor(hexString: $0) }) ?? nil
            let secondaryLight = defaults.string(forKey: "light_secondaryLight").map({ UIColor(hexString: $0) }) ?? nil
            let secondaryDark = defaults.string(forKey: "light_secondaryDark").map({ UIColor(hexString: $0) }) ?? nil
            let tertiary = defaults.string(forKey: "light_tertiary").map({ UIColor(hexString: $0) }) ?? nil
            let text = defaults.string(forKey: "light_text").map({ UIColor(hexString: $0) }) ?? nil
            let textLight = defaults.string(forKey: "light_textLight").map({ UIColor(hexString: $0) }) ?? nil
            let textDark = defaults.string(forKey: "light_textDark").map({ UIColor(hexString: $0) }) ?? nil
            let textError = defaults.string(forKey: "light_textError").map({ UIColor(hexString: $0) }) ?? nil
            let background = defaults.string(forKey: "light_background").map({ UIColor(hexString: $0) }) ?? nil
            let backgroundLight = defaults.string(forKey: "light_backgroundLight").map({ UIColor(hexString: $0) }) ?? nil
            let backgroundDark = defaults.string(forKey: "light_backgroundDark").map({ UIColor(hexString: $0) }) ?? nil
            theme = ThemeType.light(primary: primary, primaryLight: primaryLight, primaryDark: primaryDark, secondary: secondary, secondaryLight: secondaryLight, secondaryDark: secondaryDark, tertiary: tertiary, text: text, textLight: textLight, textDark: textDark, textError: textError, background: background, backgroundLight: backgroundLight, backgroundDark: backgroundDark)
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
        let theme = isDark ? ThemeType.dark(primary: primary?.themeCompatible(), primaryLight: primaryLight?.themeCompatible(), primaryDark: primaryDark?.themeCompatible(), secondary: secondary?.themeCompatible(), secondaryLight: secondaryLight?.themeCompatible(), secondaryDark: secondaryDark?.themeCompatible(), tertiary: tertiary?.themeCompatible()) : ThemeType.light(primary: primary?.themeCompatible(), primaryLight: primaryLight?.themeCompatible(), primaryDark: primaryDark?.themeCompatible(), secondary: secondary?.themeCompatible(), secondaryLight: secondaryLight?.themeCompatible(), secondaryDark: secondaryDark?.themeCompatible(), tertiary: tertiary?.themeCompatible())
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
    
    public static func setLightThemeColor(primary: UIColor, primaryLight: UIColor, primaryDark: UIColor, secondary: UIColor, secondaryLight: UIColor, secondaryDark: UIColor, tertiary: UIColor, text: UIColor? = nil, textLight: UIColor? = nil, textDark: UIColor? = nil, textError: UIColor? = nil, background: UIColor? = nil, backgroundLight: UIColor? = nil, backgroundDark: UIColor? = nil) {
        let defaults = UserDefaults.standard
        defaults.set(primary.hexString, forKey: "light_primary")
        defaults.set(primaryLight.hexString, forKey: "light_primaryLight")
        defaults.set(primaryDark.hexString, forKey: "light_primaryDark")
        defaults.set(secondary.hexString, forKey: "light_secondary")
        defaults.set(secondaryLight.hexString, forKey: "light_secondaryLight")
        defaults.set(secondaryDark.hexString, forKey: "light_secondaryDark")
        defaults.set(tertiary.hexString, forKey: "light_tertiary")
        
        if let text = text {
            defaults.set(text.hexString, forKey: "light_text")
        }
        if let textLight = textLight {
            defaults.set(textLight.hexString, forKey: "light_textLight")
        }
        if let textDark = textDark {
            defaults.set(textDark.hexString, forKey: "light_textDark")
        }
        if let textError = textError {
            defaults.set(textError.hexString, forKey: "light_textError")
        }
        
        if let background = background {
            defaults.set(background.hexString, forKey: "light_background")
        }
        if let backgroundLight = backgroundLight {
            defaults.set(backgroundLight.hexString, forKey: "light_backgroundLight")
        }
        if let backgroundDark = backgroundDark {
            defaults.set(backgroundDark.hexString, forKey: "light_backgroundDark")
        }
    }
    
    public static func setDarkThemeColor(primary: UIColor, primaryLight: UIColor, primaryDark: UIColor, secondary: UIColor, secondaryLight: UIColor, secondaryDark: UIColor, tertiary: UIColor, text: UIColor? = nil, textLight: UIColor? = nil, textDark: UIColor? = nil, textError: UIColor? = nil, background: UIColor? = nil, backgroundLight: UIColor? = nil, backgroundDark: UIColor? = nil) {
        let defaults = UserDefaults.standard
        defaults.set(primary.hexString, forKey: "dark_primary")
        defaults.set(primaryLight.hexString, forKey: "dark_primaryLight")
        defaults.set(primaryDark.hexString, forKey: "dark_primaryDark")
        defaults.set(secondary.hexString, forKey: "dark_secondary")
        defaults.set(secondaryLight.hexString, forKey: "dark_secondaryLight")
        defaults.set(secondaryDark.hexString, forKey: "dark_secondaryDark")
        defaults.set(tertiary.hexString, forKey: "dark_tertiary")
        
        if let text = text {
            defaults.set(text.hexString, forKey: "dark_text")
        }
        if let textLight = textLight {
            defaults.set(textLight.hexString, forKey: "dark_textLight")
        }
        if let textDark = textDark {
            defaults.set(textDark.hexString, forKey: "dark_textDark")
        }
        if let textError = textError {
            defaults.set(textError.hexString, forKey: "dark_textError")
        }
        
        if let background = background {
            defaults.set(background.hexString, forKey: "dark_background")
        }
        if let backgroundLight = backgroundLight {
            defaults.set(backgroundLight.hexString, forKey: "dark_backgroundLight")
        }
        if let backgroundDark = backgroundDark {
            defaults.set(backgroundDark.hexString, forKey: "dark_backgroundDark")
        }
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
    
    func themeCompatible() -> UIColor {
        let r = redComponent
        let g = greenComponent
        let b = blueComponent
        let a = alphaComponent
        return UIColor(red: r / 255, green: g / 255, blue: b / 255, alpha: a)
    }

    var redComponent: CGFloat {
      var red: CGFloat = 0
      getRed(&red, green: nil , blue: nil, alpha: nil)
      return red
    }

    var greenComponent: CGFloat {
      var green: CGFloat = 0
      getRed(nil, green: &green , blue: nil, alpha: nil)
      return green
    }

    var blueComponent: CGFloat {
      var blue: CGFloat = 0
      getRed(nil, green: nil , blue: &blue, alpha: nil)
      return blue
    }

    var alphaComponent: CGFloat {
      var alpha: CGFloat = 0
      getRed(nil, green: nil , blue: nil, alpha: &alpha)
      return alpha
    }

    var hueComponent: CGFloat {
      var hue: CGFloat = 0
      getHue(&hue, saturation: nil, brightness: nil, alpha: nil)
      return hue
    }

    var saturationComponent: CGFloat {
      var saturation: CGFloat = 0
      getHue(nil, saturation: &saturation, brightness: nil, alpha: nil)
      return saturation
    }

    var brightnessComponent: CGFloat {
      var brightness: CGFloat = 0
      getHue(nil, saturation: nil, brightness: &brightness, alpha: nil)
      return brightness
    }
}
