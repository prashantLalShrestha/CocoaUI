//
//  TableViewCell.swift
//  CoreUIKit
//
//  Created by Prashant Shrestha on 6/18/19.
//  Copyright © 2019 Prashant Shrestha. All rights reserved.
//

import UIKit
import LocalizeX

open class TableViewCell: UITableViewCell, ThemeConfigurable, Localizable {
    
    public var isSelection = false
    public var selectionColor: UIColor? {
        didSet {
            setSelected(isSelected, animated: true)
        }
    }
    
    public lazy var containerView: View = {
        let view = View()
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        return view
    }()
    
    public lazy var stackView: StackView = {
        let subviews: [UIView] = []
        let view = StackView(arrangedSubviews: subviews)
        view.axis = .horizontal
        view.alignment = .center
        self.containerView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: self.containerView.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: self.containerView.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: self.containerView.rightAnchor).isActive = true
        return view
    }()
    
    private var isContainerViewSet: Bool = false
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        languageChanged()
        self.registerForThemeEvent()
        makeUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.registerForLocalizeEvent()
    }
    
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        languageChanged()
    }
    
    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        backgroundColor = selected ? selectionColor : .clear
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        if containerView.frame != .zero && isContainerViewSet == false {
            isContainerViewSet = true
            themeChanged()
        }
    }
    
    open func makeUI() {
        layer.masksToBounds = true
        selectionStyle = .none
        backgroundColor = .clear
        
        updateUI()
    }
    
    open func updateUI() {
        setNeedsDisplay()
    }
    
    open func applyTheme(_ theme: Theme) {
        
    }
    
    open func languageChanged() {
        
    }
}
