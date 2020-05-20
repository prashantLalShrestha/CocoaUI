//
//  Theme.swift
//  CocoaUI
//
//  Created by Prashant Shrestha on 5/18/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit

public protocol Theme {
    var primary: UIColor { get }
    var primaryLight: UIColor { get }
    var primaryDark: UIColor { get }
    var secondary: UIColor { get }
    var secondaryLight: UIColor { get }
    var secondaryDark: UIColor { get }
    var tertiary: UIColor { get }
    var separator: UIColor { get }
    var separatorDark: UIColor { get }
    var text: UIColor { get }
    var textLight: UIColor { get }
    var textGray: UIColor { get }
    var textInactive: UIColor { get }
    var textError: UIColor { get }
    var background: UIColor { get }
    var backgroundDark: UIColor { get }
    var statusBarStyle: UIStatusBarStyle { get }
    var barStyle: UIBarStyle { get }
    var keyboardAppearance: UIKeyboardAppearance { get }
    var blurStyle: UIBlurEffect.Style { get }
    var shadow: UIColor { get }
    var clear: UIColor { get }
}

struct LightTheme: Theme {
    var primary: UIColor = #colorLiteral(red: 0.09803921569, green: 0.2980392157, blue: 0.7058823529, alpha: 1)
    var primaryLight: UIColor = #colorLiteral(red: 0.09803921569, green: 0.2980392157, blue: 0.7058823529, alpha: 0.2)
    var primaryDark: UIColor = #colorLiteral(red: 0.01960784314, green: 0.2039215686, blue: 0.5725490196, alpha: 1)
    var secondary: UIColor = #colorLiteral(red: 0.007843137255, green: 0.7450980392, blue: 0.6980392157, alpha: 1)
    var secondaryLight: UIColor = #colorLiteral(red: 0.007843137255, green: 0.7450980392, blue: 0.6980392157, alpha: 1)
    var secondaryDark: UIColor = #colorLiteral(red: 0.007843137255, green: 0.6784313725, blue: 0.6352941176, alpha: 1)
    var tertiary: UIColor = #colorLiteral(red: 0.9960784314, green: 0.1921568627, blue: 0.1803921569, alpha: 1)
    let separator: UIColor = UIColor.Extra.iceBlue
    let separatorDark: UIColor = UIColor.Extra.lightBlueGrey
    let text: UIColor = UIColor.Extra.dark
    let textLight: UIColor = UIColor.Extra.greyBlue
    let textGray: UIColor = UIColor.Extra.darkGreyBlue
    let textInactive: UIColor = UIColor.Extra.gunmetal
    let textError: UIColor = UIColor.red
    let background: UIColor = UIColor.white
    let backgroundDark: UIColor = UIColor.Extra.iceBlue
    let statusBarStyle = UIStatusBarStyle.default
    let barStyle = UIBarStyle.default
    let keyboardAppearance = UIKeyboardAppearance.light
    let blurStyle = UIBlurEffect.Style.extraLight
    let shadow: UIColor = UIColor(named: "col_shadow", in: Bundle.main, compatibleWith: nil) ?? UIColor.black
    let clear: UIColor = UIColor.clear
    

    public init(primary: UIColor?, primaryLight: UIColor?, primaryDark: UIColor?, secondary: UIColor?, secondaryLight: UIColor?, secondaryDark: UIColor?, tertiary: UIColor?) {
        self.primary = primary ?? self.primary
        self.primaryLight = primaryLight ?? self.primaryLight
        self.primaryDark = primaryDark ?? self.primaryDark
        self.secondary = secondary ?? self.secondary
        self.secondaryLight = secondaryLight ?? self.secondaryLight
        self.secondaryDark = secondaryDark ?? self.secondaryDark
        self.tertiary = tertiary ?? self.tertiary
    }
}

struct DarkTheme: Theme {
    var primary: UIColor = #colorLiteral(red: 0.09803921569, green: 0.2980392157, blue: 0.7058823529, alpha: 1)
    var primaryLight: UIColor = #colorLiteral(red: 0.09803921569, green: 0.2980392157, blue: 0.7058823529, alpha: 0.2)
    var primaryDark: UIColor = #colorLiteral(red: 0.01960784314, green: 0.2039215686, blue: 0.5725490196, alpha: 1)
    var secondary: UIColor = #colorLiteral(red: 0.007843137255, green: 0.7450980392, blue: 0.6980392157, alpha: 1)
    var secondaryLight: UIColor = #colorLiteral(red: 0.007843137255, green: 0.7450980392, blue: 0.6980392157, alpha: 1)
    var secondaryDark: UIColor = #colorLiteral(red: 0.007843137255, green: 0.6784313725, blue: 0.6352941176, alpha: 1)
    var tertiary: UIColor = #colorLiteral(red: 0.9960784314, green: 0.1921568627, blue: 0.1803921569, alpha: 1)
    let separator: UIColor = UIColor.black
    let separatorDark: UIColor = UIColor.Extra.lightBlueGrey
    let text: UIColor = UIColor.white
    let textLight: UIColor = UIColor.Extra.greyBlue
    let textGray: UIColor = UIColor.Extra.darkGreyBlue
    let textInactive: UIColor = UIColor.Extra.gunmetal
    let background: UIColor = UIColor.black
    let backgroundDark: UIColor = UIColor.black
    let textError: UIColor = UIColor.red
    let statusBarStyle = UIStatusBarStyle.lightContent
    let barStyle = UIBarStyle.black
    let keyboardAppearance = UIKeyboardAppearance.dark
    let blurStyle = UIBlurEffect.Style.dark
    let shadow: UIColor = UIColor.white
    let clear: UIColor = UIColor.clear
    
    public init(primary: UIColor?, primaryLight: UIColor?, primaryDark: UIColor?, secondary: UIColor?, secondaryLight: UIColor?, secondaryDark: UIColor?, tertiary: UIColor?) {
        self.primary = primary ?? self.primary
        self.primaryLight = primaryLight ?? self.primaryLight
        self.primaryDark = primaryDark ?? self.primaryDark
        self.secondary = secondary ?? self.secondary
        self.secondaryLight = secondaryLight ?? self.secondaryLight
        self.secondaryDark = secondaryDark ?? self.secondaryDark
        self.tertiary = tertiary ?? self.tertiary
    }
    
}
