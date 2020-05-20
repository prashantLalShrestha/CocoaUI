//
//  UIButton+Ext.swift
//  CocoaUI
//
//  Created by Prashant Shrestha on 5/18/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit

public extension UIButton {
    func titleLabelSizeToFit() {
        self.titleLabel?.minimumScaleFactor = 0.5
        self.titleLabel?.numberOfLines = 0
        self.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    func addAction(_ action: (() -> ())?, for event: UIControl.Event = .touchUpInside) {
        let buttonAction = ButtonAction()
        buttonAction.action = action
        self.removeTarget(self, action: #selector(buttonAction.buttonAction), for: event)
        self.addTarget(self, action: #selector(buttonAction.buttonAction), for: event)
    }
    
    private class ButtonAction {
        var action: (() -> ())?
        
        @objc func buttonAction() {
            action?()
        }
    }
}
