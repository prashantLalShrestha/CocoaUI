//
//  Button.swift
//  CocoaUI
//
//  Created by Prashant Shrestha on 5/20/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit

open class Button: UIButton {
    
    public var tapAction: ((_ sender: Button) -> ())?
    
    open override var isEnabled: Bool {
        didSet {
            if isEnabled {
                self.alpha = 1.0
            } else {
                self.alpha = 0.32
            }
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeUI()
    }
    
    public func makeUI() {
        
        layer.masksToBounds = false
        self.clipsToBounds = true
        titleLabel?.lineBreakMode = .byWordWrapping
        
        
        self.titleLabel?.font = UIFont.smallLight
        
        updateUI()
        
        self.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    open func applyTheme(theme: Theme, type: ColorThemeType) {
        switch type {
        case .primary:
            self.backgroundColor = theme.primary
            self.setTitleColor(theme.background, for: .normal)
            self.setTitleColor(theme.background, for: .disabled)
        case .secondary:
            self.backgroundColor = theme.secondary
            self.setTitleColor(theme.background, for: .normal)
            break
        case .tertiary:
            self.backgroundColor = theme.clear
            self.setTitleColor(theme.text, for: .normal)
        }
    }
    
    @objc func buttonAction() {
        tapAction?(self)
    }
    
    public func updateUI() {
        setNeedsDisplay()
    }
    
}
