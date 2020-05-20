//
//  TabBarItem.swift
//  CocoaUI
//
//  Created by Prashant Shrestha on 5/18/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit

@IBDesignable open class TabBarItem: UITabBarItem {
    
    @IBInspectable public var scaledImage: UIImage? = nil {
        didSet {
            image = scaledImage?.compress(compressionQuality: 1.0, newSize: CGSize(width: 25, height: 25))
        }
    }
    
}
