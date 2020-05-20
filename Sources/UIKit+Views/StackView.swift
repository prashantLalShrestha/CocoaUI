//
//  StackView.swift
//  CocoaUI
//
//  Created by Prashant Shrestha on 5/18/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit

public class StackView: UIStackView {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }

    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeUI()
    }
    
    public func makeUI() {
        spacing = 0
        axis = .vertical
        distribution = .fill
        
        updateUI()
    }
    
    public func updateUI() {
        setNeedsDisplay()
    }
}
