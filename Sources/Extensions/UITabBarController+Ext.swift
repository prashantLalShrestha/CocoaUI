//
//  UITabBarController+Ext.swift
//  CocoaUI
//
//  Created by Prashant Shrestha on 5/18/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit

public extension UITabBarController {
    func hideTabbar() {
        if tabBar.isHidden {
            return
        }
        tabBar.isHidden = true
        var frame = view.frame
        frame.size.height += tabBar.frame.size.height
        view.frame = frame
    }
    
    func showTabBar() {
        if !tabBar.isHidden {
            return
        }
        var frame = view.frame
        frame.size.height -= tabBar.frame.size.height
        view.frame = frame
        tabBar.isHidden = false
    }
}
