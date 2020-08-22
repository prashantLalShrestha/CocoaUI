//
//  Switch.swift
//  CocoaUI
//
//  Created by Prashant Shrestha on 5/18/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit

open class Switch: UISwitch {
    
    public var toggled: ((_ sender: Switch) -> ())?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeUI()
    }
    
    open func makeUI() {
        self.addTarget(self, action: #selector(switchToggled(_:)), for: .valueChanged)
    }
    
    @objc private func switchToggled(_ sender: Switch) {
        self.toggled?(sender)
    }
}
