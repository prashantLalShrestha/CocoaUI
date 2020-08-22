//
//  UIImage+Shapes.swift
//  CocoaUI
//
//  Created by Prashant Shrestha on 5/26/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import Foundation
import UIKit

public extension UIImage {
    
    static func closeImage() -> UIImage {
        return UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512)).image { _ in
            //// Color Declarations
            let fillColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)

            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 284.29, y: 256))
            bezierPath.addLine(to: CGPoint(x: 506.14, y: 34.14))
            bezierPath.addCurve(to: CGPoint(x: 506.14, y: 5.86), controlPoint1: CGPoint(x: 513.95, y: 26.33), controlPoint2: CGPoint(x: 513.95, y: 13.67))
            bezierPath.addCurve(to: CGPoint(x: 477.86, y: 5.86), controlPoint1: CGPoint(x: 498.33, y: -1.95), controlPoint2: CGPoint(x: 485.67, y: -1.95))
            bezierPath.addLine(to: CGPoint(x: 256, y: 227.72))
            bezierPath.addLine(to: CGPoint(x: 34.14, y: 5.86))
            bezierPath.addCurve(to: CGPoint(x: 5.86, y: 5.86), controlPoint1: CGPoint(x: 26.33, y: -1.95), controlPoint2: CGPoint(x: 13.67, y: -1.95))
            bezierPath.addCurve(to: CGPoint(x: 5.86, y: 34.14), controlPoint1: CGPoint(x: -1.95, y: 13.67), controlPoint2: CGPoint(x: -1.95, y: 26.33))
            bezierPath.addLine(to: CGPoint(x: 227.72, y: 256))
            bezierPath.addLine(to: CGPoint(x: 5.86, y: 477.86))
            bezierPath.addCurve(to: CGPoint(x: 5.86, y: 506.14), controlPoint1: CGPoint(x: -1.95, y: 485.67), controlPoint2: CGPoint(x: -1.95, y: 498.33))
            bezierPath.addCurve(to: CGPoint(x: 20, y: 512), controlPoint1: CGPoint(x: 9.76, y: 510.05), controlPoint2: CGPoint(x: 14.88, y: 512))
            bezierPath.addCurve(to: CGPoint(x: 34.14, y: 506.14), controlPoint1: CGPoint(x: 25.12, y: 512), controlPoint2: CGPoint(x: 30.24, y: 510.05))
            bezierPath.addLine(to: CGPoint(x: 256, y: 284.29))
            bezierPath.addLine(to: CGPoint(x: 477.86, y: 506.14))
            bezierPath.addCurve(to: CGPoint(x: 492, y: 512), controlPoint1: CGPoint(x: 481.76, y: 510.05), controlPoint2: CGPoint(x: 486.88, y: 512))
            bezierPath.addCurve(to: CGPoint(x: 506.14, y: 506.14), controlPoint1: CGPoint(x: 497.12, y: 512), controlPoint2: CGPoint(x: 502.24, y: 510.05))
            bezierPath.addCurve(to: CGPoint(x: 506.14, y: 477.86), controlPoint1: CGPoint(x: 513.95, y: 498.33), controlPoint2: CGPoint(x: 513.95, y: 485.67))
            bezierPath.addLine(to: CGPoint(x: 284.29, y: 256))
            bezierPath.close()
            fillColor.setFill()
            bezierPath.fill()
        }
    }
    
    static func backArrowImage() -> UIImage {
        return UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512)).image { _ in
            //// Color Declarations
            let fillColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)

            let bezier2Path = UIBezierPath()
            bezier2Path.move(to: CGPoint(x: 353.64, y: 477.87))
            bezier2Path.addLine(to: CGPoint(x: 146.34, y: 270.14))
            bezier2Path.addCurve(to: CGPoint(x: 146.36, y: 241.84), controlPoint1: CGPoint(x: 138.55, y: 262.34), controlPoint2: CGPoint(x: 138.55, y: 249.66))
            bezier2Path.addLine(to: CGPoint(x: 353.64, y: 34.13))
            bezier2Path.addCurve(to: CGPoint(x: 353.61, y: 5.84), controlPoint1: CGPoint(x: 361.45, y: 26.31), controlPoint2: CGPoint(x: 361.43, y: 13.65))
            bezier2Path.addCurve(to: CGPoint(x: 325.33, y: 5.87), controlPoint1: CGPoint(x: 345.79, y: -1.96), controlPoint2: CGPoint(x: 333.13, y: -1.95))
            bezier2Path.addLine(to: CGPoint(x: 118.06, y: 213.57))
            bezier2Path.addCurve(to: CGPoint(x: 118.05, y: 298.41), controlPoint1: CGPoint(x: 94.67, y: 236.97), controlPoint2: CGPoint(x: 94.67, y: 275.03))
            bezier2Path.addLine(to: CGPoint(x: 325.33, y: 506.13))
            bezier2Path.addCurve(to: CGPoint(x: 339.49, y: 512), controlPoint1: CGPoint(x: 329.24, y: 510.04), controlPoint2: CGPoint(x: 334.36, y: 512))
            bezier2Path.addCurve(to: CGPoint(x: 353.61, y: 506.16), controlPoint1: CGPoint(x: 344.6, y: 512), controlPoint2: CGPoint(x: 349.71, y: 510.05))
            bezier2Path.addCurve(to: CGPoint(x: 353.64, y: 477.87), controlPoint1: CGPoint(x: 361.43, y: 498.35), controlPoint2: CGPoint(x: 361.45, y: 485.69))
            bezier2Path.close()
            fillColor.setFill()
            bezier2Path.fill()
        }
    }
    
}
