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
    var text: UIColor { get }
    var textLight: UIColor { get }
    var textDark: UIColor { get }
    var textError: UIColor { get }
    var background: UIColor { get }
    var backgroundLight: UIColor { get }
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
    var text: UIColor = UIColor.Extra.dark
    var textLight: UIColor = UIColor.Extra.greyBlue
    var textDark: UIColor = UIColor.Extra.darkGreyBlue
    var textError: UIColor = UIColor.red
    var background: UIColor = UIColor.white
    var backgroundLight: UIColor = UIColor.Extra.iceBlue
    var backgroundDark: UIColor = UIColor.Extra.lightBlueGrey
    let statusBarStyle = UIStatusBarStyle.default
    let barStyle = UIBarStyle.default
    let keyboardAppearance = UIKeyboardAppearance.light
    let blurStyle = UIBlurEffect.Style.extraLight
    let shadow: UIColor = UIColor.black
    let clear: UIColor = UIColor.clear
    

    public init(primary: UIColor?, primaryLight: UIColor?, primaryDark: UIColor?, secondary: UIColor?, secondaryLight: UIColor?, secondaryDark: UIColor?, tertiary: UIColor?, text: UIColor? = nil, textLight: UIColor? = nil, textDark: UIColor? = nil, textError: UIColor? = nil, background: UIColor? = nil, backgroundLight: UIColor? = nil, backgroundDark: UIColor? = nil) {
        self.primary = primary ?? self.primary
        self.primaryLight = primaryLight ?? self.primaryLight
        self.primaryDark = primaryDark ?? self.primaryDark
        self.secondary = secondary ?? self.secondary
        self.secondaryLight = secondaryLight ?? self.secondaryLight
        self.secondaryDark = secondaryDark ?? self.secondaryDark
        self.tertiary = tertiary ?? self.tertiary
        self.text = text ?? self.text
        self.textLight = textLight ?? self.textLight
        self.textDark = textDark ?? self.textDark
        self.textError = textError ?? self.textError
        self.background = background ?? self.background
        self.backgroundLight = backgroundLight ?? self.backgroundLight
        self.backgroundDark = backgroundDark ?? self.backgroundDark
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
    var text: UIColor = UIColor.white
    var textLight: UIColor = UIColor.Extra.greyBlue
    var textDark: UIColor = UIColor.Extra.darkGreyBlue
    var textError: UIColor = UIColor.red
    var background: UIColor = UIColor.black
    var backgroundLight: UIColor = UIColor.Extra.lightBlueGrey
    var backgroundDark: UIColor = UIColor.black
    let statusBarStyle = UIStatusBarStyle.lightContent
    let barStyle = UIBarStyle.black
    let keyboardAppearance = UIKeyboardAppearance.dark
    let blurStyle = UIBlurEffect.Style.dark
    let shadow: UIColor = UIColor.white
    let clear: UIColor = UIColor.clear
    
    public init(primary: UIColor?, primaryLight: UIColor?, primaryDark: UIColor?, secondary: UIColor?, secondaryLight: UIColor?, secondaryDark: UIColor?, tertiary: UIColor?, text: UIColor? = nil, textLight: UIColor? = nil, textDark: UIColor? = nil, textError: UIColor? = nil, background: UIColor? = nil, backgroundLight: UIColor? = nil, backgroundDark: UIColor? = nil) {
        self.primary = primary ?? self.primary
        self.primaryLight = primaryLight ?? self.primaryLight
        self.primaryDark = primaryDark ?? self.primaryDark
        self.secondary = secondary ?? self.secondary
        self.secondaryLight = secondaryLight ?? self.secondaryLight
        self.secondaryDark = secondaryDark ?? self.secondaryDark
        self.tertiary = tertiary ?? self.tertiary
        self.text = text ?? self.text
        self.textLight = textLight ?? self.textLight
        self.textDark = textDark ?? self.textDark
        self.textError = textError ?? self.textError
        self.background = background ?? self.background
        self.backgroundLight = backgroundLight ?? self.backgroundLight
        self.backgroundDark = backgroundDark ?? self.backgroundDark
    }
    
}
