//
//  ErrorTableViewCell.swift
//  CoreUIKit
//
//  Created by Prashant Shrestha on 2/5/20.
//  Copyright © 2020 Prashant Shrestha. All rights reserved.
//

import UIKit

public class ErrorTableViewCell: TableViewCell {
    
    
    lazy var errorImageView: ImageView = {
        let view = ImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    lazy var imageContainerView: View = {
        let view = View()
        view.addSubview(errorImageView)
        errorImageView.translatesAutoresizingMaskIntoConstraints = false
        errorImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        errorImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        errorImageView.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor).isActive = true
        errorImageView.leftAnchor.constraint(greaterThanOrEqualTo: view.leftAnchor).isActive = true
        errorImageView.rightAnchor.constraint(lessThanOrEqualTo: view.rightAnchor).isActive = true
        errorImageView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor).isActive = true
        errorImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.375).isActive = true
        errorImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.375).isActive = true
        return view
    }()
    
    lazy var titleLabel: Label = {
        let view = Label()
        view.text = "---------"
        view.font = UIFont.mediumLargeBold
        view.textAlignment = .center
        view.numberOfLines = 0
        return view
    }()
    lazy var descriptionLabel: Label = {
        let view = Label()
        view.text = "---------"
        view.font = UIFont.smallLight
        view.textAlignment = .center
        view.numberOfLines = 0
        return view
    }()
    lazy var contentStackView: StackView = {
        let subViews = [titleLabel, descriptionLabel]
        let view = StackView(arrangedSubviews: subViews)
        view.axis = .vertical
        view.spacing = BaseDimensions.footerViewSpacing
        view.alignment = .fill
        view.distribution = .fill
        return view
    }()
    
    lazy var button: Button = {
        let view = Button()
        view.layer.borderWidth = 1.0
        view.titleLabel?.font = UIFont.smallLight
        layer.masksToBounds = true
        view.layer.cornerRadius = BaseDimensions.buttonHeight * 0.45
        view.contentEdgeInsets = UIEdgeInsets(top: 10.0, left: 80.0, bottom: 10.0, right: 80.0)
        return view
    }()
    
    override public func makeUI() {
        super.makeUI()
        
        containerView.addSubview(imageContainerView)
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        imageContainerView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: BaseDimensions.viewMargin).isActive = true
        imageContainerView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        imageContainerView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        
        containerView.addSubview(contentStackView)
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        contentStackView.topAnchor.constraint(equalTo: imageContainerView.bottomAnchor, constant: BaseDimensions.viewMargin).isActive = true
        contentStackView.leftAnchor.constraint(greaterThanOrEqualTo: containerView.leftAnchor, constant: BaseDimensions.viewMargin).isActive = true
        contentStackView.rightAnchor.constraint(lessThanOrEqualTo: containerView.rightAnchor, constant: -BaseDimensions.viewMargin).isActive = true
        
        containerView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: contentStackView.bottomAnchor, constant: BaseDimensions.viewMargin).isActive = true
        button.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -BaseDimensions.viewMargin).isActive = true
        button.heightAnchor.constraint(equalToConstant: BaseDimensions.buttonHeight * 0.9).isActive = true
    }
    
    override public func languageChanged() {
        super.languageChanged()
    }
    
    public override func applyTheme(_ theme: Theme) {
        super.applyTheme(theme)
        self.contentView.backgroundColor = theme.backgroundDark
        
        containerView.backgroundColor = theme.background
        
        titleLabel.textColor = theme.text
        descriptionLabel.textColor = theme.text
        
        button.backgroundColor = theme.clear
        button.setTitleColor(theme.text, for: .normal)
        button.layer.borderColor = theme.textGray.cgColor
    }
    
    public func bind(image: UIImage?, title: String?, description: String?, buttonTapAction: (() -> ())? = nil) {
        errorImageView.image = image
        
        titleLabel.text = title
        descriptionLabel.text = description
        
        if let buttonTapAction = buttonTapAction {
            button.alpha = 1.0
            button.isUserInteractionEnabled = true
            button.tapAction = { _ in
                buttonTapAction()
            }
        } else {
            button.alpha = 0.0
            button.isUserInteractionEnabled = false
        }
    }
    
}
