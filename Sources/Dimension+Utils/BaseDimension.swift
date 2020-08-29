//
//  BaseDimension.swift
//  CoreUIKit
//
//  Created by Prashant Shrestha on 6/18/19.
//  Copyright © 2019 Prashant Shrestha. All rights reserved.
//

import UIKit
import DeviceX

public struct BaseDimensions {

    // View
    public static var viewMargin: CGFloat {
        switch UIDevice.deviceSize {
        case .screen4Inches:
            return 16
        case .screen4Dot7Inches, .screen5Dot5Inches:
            return 24
        case .screen5Dot8Inches, .screen6Dot1Inches, .screen6Dot5Inches:
            return 30
        default:
            return 30
        }
    }
    public static var viewSpacing: CGFloat {
        switch UIDevice.deviceSize {
        case .screen4Inches:
            return 12
        case .screen4Dot7Inches, .screen5Dot5Inches:
            return 16
        case .screen5Dot8Inches, .screen6Dot1Inches, .screen6Dot5Inches:
            return 20
        default:
            return 20
        }
    }
    public static var spacedViewsSpacing: CGFloat {
        switch UIDevice.deviceSize {
        case .screen4Inches:
            return 26
        case .screen4Dot7Inches, .screen5Dot5Inches:
            return 38
        case .screen5Dot8Inches, .screen6Dot1Inches, .screen6Dot5Inches:
            return 50
        default:
            return 50
        }
    }
    public static var footerViewSpacing: CGFloat {
        return 8
    }

    // Buttons
    public static var buttonHorizontalMargin: CGFloat {
        switch UIDevice.deviceSize {
        case .screen4Inches:
            return 20
        case .screen4Dot7Inches, .screen5Dot5Inches:
            return 25
        case .screen5Dot8Inches, .screen6Dot1Inches, .screen6Dot5Inches:
            return 30
        default:
            return 30
        }
    }
    public static var buttonHeight: CGFloat {
        switch UIDevice.deviceSize {
        case .screen4Inches:
            return 40
        case .screen4Dot7Inches, .screen5Dot5Inches:
            return 48
        case .screen5Dot8Inches, .screen6Dot1Inches, .screen6Dot5Inches:
            return 50
        default:
            return 50
        }
    }

    // InputFields
    public static var inputFieldsHorizontalMargin: CGFloat {
        switch UIDevice.deviceSize {
        case .screen4Inches:
            return 26
        case .screen4Dot7Inches, .screen5Dot5Inches:
            return 38
        case .screen5Dot8Inches, .screen6Dot1Inches, .screen6Dot5Inches:
            return 40
        default:
            return 40
        }
    }
    public static var inputFieldVerticalSpacing: CGFloat {
        return 12
    }
    public static var textFieldHeight: CGFloat {
        return 78
    }
    public static var minimumTextViewHeight: CGFloat {
        switch UIDevice.deviceSize {
        case .screen4Inches:
            return 128
        case .screen4Dot7Inches, .screen5Dot5Inches:
            return 144
        case .screen5Dot8Inches, .screen6Dot1Inches, .screen6Dot5Inches:
            return 152
        default:
            return 152
        }
    }


    public static var inset: CGFloat {
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
    public static let tabBarHeight: CGFloat = 58
    public static let toolBarHeight: CGFloat = 66
    public static let navBarWithStatusBarHeight: CGFloat = 64
    public static let tableRowHeight: CGFloat = 50
    public static var segmentedControlHeight: CGFloat {
        switch UIDevice.deviceSize {
        case .screen4Inches:
            return 25
        case .screen4Dot7Inches, .screen5Dot5Inches:
            return 30
        case .screen5Dot8Inches, .screen6Dot1Inches, .screen6Dot5Inches:
            return 30
        default:
            return 30
        }
    }
    public static var iconHeight: CGFloat {
        switch UIDevice.deviceSize {
        case .screen4Inches:
            return 16
        case .screen4Dot7Inches, .screen5Dot5Inches:
            return 18
        case .screen5Dot8Inches, .screen6Dot1Inches, .screen6Dot5Inches:
            return 20
        default:
            return 20
        }
    }
    public static var checkBoxHeight: CGFloat {
        return 20
    }
    
    public static var cornerRadius: CGFloat {
        switch UIDevice.deviceSize {
        case .screen4Inches:
            return 12
        case .screen4Dot7Inches, .screen5Dot5Inches:
            return 12
        case .screen5Dot8Inches, .screen6Dot1Inches, .screen6Dot5Inches:
            return 12
        default:
            return 12
        }
    }
    public static var cornerRadiusSmall: CGFloat {
        return 4
    }
    public static let borderWidth: CGFloat = 1
    public static let separatorHeight: CGFloat = 1

    public static var sliderHeight: CGFloat {
        return 20
    }
    public static var dropDownHeight: CGFloat {
        return 48
    }

    public static var tableViewHeaderHeight: CGFloat {
        return 51
    }

    public static var statusBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.size.height
    }

    public static var topTabBarHeight: CGFloat {
        return 44
    }
    
}
