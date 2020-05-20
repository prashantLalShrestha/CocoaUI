//
//  ImageView.swift
//  CocoaUI
//
//  Created by Prashant Shrestha on 5/18/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit

public class ImageView: UIImageView {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    
    override public init(image: UIImage?) {
        super.init(image: image)
        makeUI()
    }
    
    override public init(image: UIImage?, highlightedImage: UIImage?) {
        super.init(image: image, highlightedImage: highlightedImage)
        makeUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeUI()
    }
    
    public func makeUI() {
        layer.masksToBounds = true
        contentMode = .center
        
        updateUI()
    }
    
    public func updateUI() {
        setNeedsDisplay()
    }
}
