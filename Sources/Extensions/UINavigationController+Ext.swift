//
//  UINavigationController+Ext.swift
//  CocoaUI
//
//  Created by Prashant Shrestha on 5/18/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit

public extension UINavigationController {
    func viewController<T: UIViewController>(of type: T.Type) -> T? {
        return (viewControllers.first(where: { $0 is T }) as? T)
    }
    
    func visibleViewController<T: UIViewController>(of type: T.Type) -> T? {
        return visibleViewController as? T
    }
}
