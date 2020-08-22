//
//  TableView.swift
//  CoreUIKit
//
//  Created by Prashant Shrestha on 6/18/19.
//  Copyright © 2019 Prashant Shrestha. All rights reserved.
//

import UIKit

open class TableView: UITableView {
    
    public init () {
        super.init(frame: CGRect(), style: .grouped)
    }
    
    override public init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        makeUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeUI()
    }
    
    open func makeUI() {
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = 50
        sectionHeaderHeight = 40
        backgroundColor = .clear
        cellLayoutMarginsFollowReadableWidth = false
        keyboardDismissMode = .onDrag
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableHeaderView = UIView()
        tableFooterView = UIView()
    }
}
