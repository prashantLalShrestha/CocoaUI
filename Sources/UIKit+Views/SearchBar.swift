//
//  SearchBar.swift
//  CocoaUI
//
//  Created by Prashant Shrestha on 5/18/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit

public class SearchBar: UISearchBar {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeUI()
    }
    
    public func makeUI() {
        
        placeholder = "Search"
        isTranslucent = false
        
        updateUI()
    }
    
    public func updateUI() {
        setNeedsDisplay()
    }
}
