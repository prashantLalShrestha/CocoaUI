//
//  UIView+Ext.swift
//  CocoaUI
//
//  Created by Prashant Shrestha on 5/18/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit

public extension UIView {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func concaveCorners(corners: [UIRectCorner], cornerRadius: CGFloat) {
        let path = UIBezierPath().concaveRect(rect: self.bounds, corners: corners, cornerRadius: cornerRadius)
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func addBottomRoundedEdge(desiredCurve: CGFloat?) {
        let offset: CGFloat = self.frame.width / desiredCurve!
        let bounds: CGRect = self.bounds
        
        let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height / 2)
        let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)
        let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset, height: bounds.size.height)
        let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
        rectPath.append(ovalPath)
        
        // Create the shape layer and set its path
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = rectPath.cgPath
        
        // Set the newly created shape layer as the mask for the view's layer
        self.layer.mask = maskLayer
    }
    
    func drawDottedLine(start p0: CGPoint, end p1: CGPoint, color: UIColor? = nil) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = color?.cgColor ?? UIColor.lightGray.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [7, 3] // 7 is the length of dash, 3 is length of the gap.

        let path = CGMutablePath()
        path.addLines(between: [p0, p1])
        shapeLayer.path = path
        self.layer.addSublayer(shapeLayer)
    }
    
    func flashView(_ duration: CFTimeInterval) {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = duration
        flash.fromValue = 0.4
        flash.toValue = 1.0
//            flash.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        flash.autoreverses = false
        
        flash.repeatCount = 0
        self.layer.add(flash, forKey: "flash")
    }
    
    func addSpinAnimation() {
        let spinAnimation = CABasicAnimation()
        spinAnimation.fromValue = 0
        spinAnimation.toValue = CGFloat.pi * 2
        spinAnimation.duration = 1
        spinAnimation.repeatCount = Float.infinity
        spinAnimation.isRemovedOnCompletion = false
        spinAnimation.fillMode = CAMediaTimingFillMode.forwards
        spinAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        self.layer.add(spinAnimation, forKey: "transform.rotation.z")
    }
    
    func removeAllAnimation() {
        self.layer.removeAllAnimations()
    }
    
    func loadViewFromNib(_ name:String) ->UIView{
        let bundle = Bundle(for: type(of: self));
        let nib = UINib(nibName: name, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil)[0] as! UIView
    }
    
    func pushTransition(_ duration: CFTimeInterval) {
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.push
        animation.subtype = CATransitionSubtype.fromTop
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.push.rawValue)
    }
    
    func moveInTransition(_ duration: CFTimeInterval) {
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.moveIn
        animation.subtype = CATransitionSubtype.fromTop
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.moveIn.rawValue)
    }
    
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.reveal
        animation.subtype = CATransitionSubtype.fromTop
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.push.rawValue)
    }
    
    func addTapGesture(tapNumber : Int = 1, target: Any , action : Selector) {
        let tap = UITapGestureRecognizer(target: target, action: action)
        tap.numberOfTapsRequired = tapNumber
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
    }
    
    //MARK:- Animation
    func shake(withDx dx:CGFloat = 20 ) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-dx, dx, -dx, dx, -dx/2, dx/2, -dx/4, dx/4, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
    
    func shortShake(withDx dx:CGFloat = 20 ) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-dx, dx, -dx, dx, -dx/2, dx/2, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
    
    func press() {
//        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [.curveEaseIn], animations: {
//            self.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
//        }) { (_) in
//            UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: [.curveEaseIn], animations: {
//                self.transform = CGAffineTransform.identity
//            }, completion: nil)
//        }
        
        UIView.animate(withDuration: 0.15, animations: {
            self.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        }, completion: { finish in
            UIView.animate(withDuration: 0.15, animations: {
                self.transform = CGAffineTransform.identity
            })
        })
    }
    func bulge() {
        UIView.animate(withDuration: 0.15, animations: {
            self.transform = CGAffineTransform(scaleX: 1.08, y: 1.08)
        }, completion: { finish in
            UIView.animate(withDuration: 0.15, animations: {
                self.transform = CGAffineTransform.identity
            })
        })
    }
    
    @objc func touchDownAnimate() {
        UIView.animate(withDuration: 0.15, animations: {
            self.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        })
    }
    
    @objc func touchUpAnimate() {
        UIView.animate(withDuration: 0.15, animations: {
            self.transform = CGAffineTransform.identity
        })
    }
    
    func setPriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) {
        self.setContentHuggingPriority(priority, for: axis)
        self.setContentCompressionResistancePriority(priority, for: axis)
    }
    
}


// MARK: - CONSTRAINTS
public extension UIView {
    func removeAllConstraints() {
        var _superview = self.superview
        
        while let superview = _superview {
            for constraint in superview.constraints {
                
                if let first = constraint.firstItem as? UIView, first == self {
                    superview.removeConstraint(constraint)
                }
                
                if let second = constraint.secondItem as? UIView, second == self {
                    superview.removeConstraint(constraint)
                }
            }
            
            _superview = superview.superview
        }
        
        self.removeConstraints(self.constraints)
        self.translatesAutoresizingMaskIntoConstraints = true
    }
    
    func pinEdges(to view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func makeConstraints(top: NSLayoutYAxisAnchor?, bottom: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero){
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
    }
    
    func pinEdgesToSuperView() {
        translatesAutoresizingMaskIntoConstraints = false
        makeConstraints(top: superview?.topAnchor, bottom: superview?.bottomAnchor, leading: superview?.leadingAnchor, trailing: superview?.trailingAnchor)
    }
    
    func makeEqualWidth(to view: UIView, multiplyBy: CGFloat = 1) {
        widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplyBy ).isActive = true
    }
    
    func makeEqualHeight(to view: UIView, multiplyBy: CGFloat = 1) {
        heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplyBy).isActive = true
    }
    
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
}
