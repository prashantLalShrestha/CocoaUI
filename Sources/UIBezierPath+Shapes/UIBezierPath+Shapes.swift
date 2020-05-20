//
//  UIBezierPath+Shapes.swift
//  CocoaUI
//
//  Created by Prashant Shrestha on 5/18/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit

public extension UIBezierPath {
    
    func concaveRect(rect: CGRect, corners: [UIRectCorner], cornerRadius: CGFloat) -> UIBezierPath {
        let halfWidth = rect.width / 2
        let halfHeight = rect.height / 2
        var cornerRadius = cornerRadius
        if cornerRadius > halfWidth || cornerRadius > halfHeight {
            cornerRadius = min(halfWidth, halfHeight)
        }
        
        let path = self
        
        let topLeft = CGPoint(x: rect.minX, y: rect.minY)
        if corners.contains(.topLeft) {
            path.move(to: CGPoint(x: topLeft.x, y: topLeft.y + cornerRadius))
            path.addArc(withCenter: topLeft, radius: cornerRadius, startAngle: .pi / 2, endAngle: 0, clockwise: false)
        } else {
            path.move(to: topLeft)
        }
        
        let topRight = CGPoint(x: rect.maxX, y: rect.minY)
        if corners.contains(.topRight) {
            path.addLine(to: CGPoint(x: topRight.x - cornerRadius, y: topRight.y))
            path.addArc(withCenter: topRight, radius: cornerRadius, startAngle: .pi, endAngle: .pi / 2, clockwise: false)
        } else {
            path.addLine(to: topRight)
        }
        
        let bottomRight = CGPoint(x: rect.maxX, y: rect.maxY)
        if corners.contains(.bottomRight) {
            path.addLine(to: CGPoint(x: bottomRight.x, y: bottomRight.y - cornerRadius))
            path.addArc(withCenter: bottomRight, radius: cornerRadius, startAngle: (.pi / 2) * 3, endAngle: .pi, clockwise: false)
        } else {
            path.addLine(to: bottomRight)
        }
        
        let bottomLeft = CGPoint(x: rect.minX, y: rect.maxY)
        if corners.contains(.bottomLeft) {
            path.addLine(to: CGPoint(x: bottomLeft.x + cornerRadius, y: bottomLeft.y))
            path.addArc(withCenter: bottomLeft, radius: cornerRadius, startAngle: 0, endAngle: (.pi / 2) * 3, clockwise: false)
        } else {
            path.addLine(to: bottomLeft)
        }
        
        path.close()
        
        return path
    }
    
}
