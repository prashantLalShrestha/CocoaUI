//
//  SegmentedControl.swift
//  CocoaUI
//
//  Created by Prashant Shrestha on 5/18/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit

open class SegmentedControl: UISegmentedControl {
    
    public var valueChanged: ((_ sender: SegmentedControl) -> ())?

    override public init(items: [Any]?) {
        super.init(items: items)
        makeUI()
    }

    override public  init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeUI()
    }

    open func makeUI() {
        self.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        layer.masksToBounds = true
        updateUI()
    }

    open func updateUI() {
        setNeedsDisplay()
    }
    
    @objc private func segmentedControlValueChanged(_ sender: SegmentedControl) {
        self.valueChanged?(sender)
    }
}
