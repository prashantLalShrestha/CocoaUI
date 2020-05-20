//
//  TabBarController.swift
//  CocoaUI
//
//  Created by Prashant Shrestha on 5/19/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit

open class TabBarController: UITabBarController {
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isTranslucent = false
    }
}
