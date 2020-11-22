//
//  View.swift
//  CocoaUI
//
//  Created by Prashant Shrestha on 5/18/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit

open class View: UIView {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeUI()
    }
    
    open func makeUI() {
        self.layer.masksToBounds = true
        updateUI()
    }
    
    open func updateUI() {
        setNeedsDisplay()
    }
    
    public func getCenter() -> CGPoint {
        return convert(center, from: superview)
    }
}
