//
//  CAGradientLayer+Ext.swift
//  CocoaUI
//
//  Created by Prashant Shrestha on 5/18/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit

public extension CAGradientLayer {
    func getImage() -> UIImage? {
        var gradientImage:UIImage?
        UIGraphicsBeginImageContext(self.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            self.render(in: context)
            gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        }
        UIGraphicsEndImageContext()
        return gradientImage
    }
}
