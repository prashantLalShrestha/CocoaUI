//
//  CollectionViewCell.swift
//  SwiftHub
//
//  Created by Prashant Shrestha on 3/25/19.
//  Copyright © 2019 Logica Beans Pvt. Ltd. All rights reserved.
//
import UIKit

open class CollectionViewCell: UICollectionViewCell, ThemeConfigurable {
    
    public lazy var containerView: View = {
        let view = View()
        view.backgroundColor = .clear
        self.contentView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
        return view
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
        
        self.registerForThemeEvent()
        themeChanged()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .themeToggled, object: nil)
    }
    
    open func makeUI() {
        self.layer.masksToBounds = true
        updateUI()
    }
    
    open func updateUI() {
        setNeedsDisplay()
    }
    
    open func applyTheme(_ theme: Theme) {
        
    }
}
