//
//  CollectionView.swift
//  SwiftHub
//
//  Created by Prashant Shrestha on 3/25/19.
//  Copyright © 2019 Logica Beans Pvt. Ltd. All rights reserved.
//

import UIKit

public class CollectionView: UICollectionView {

    public init() {
        super.init(frame: CGRect(), collectionViewLayout: UICollectionViewFlowLayout())
        makeUI()
    }

    override public init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        makeUI()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeUI()
    }

    public func makeUI() {
        self.layer.masksToBounds = true
        self.backgroundColor = .clear
        updateUI()
    }

    public func updateUI() {
        setNeedsDisplay()
    }

    public func itemWidth(forItemsPerRow itemsPerRow: Int, withInset inset: CGFloat = 0) -> CGFloat {
        let collectionWidth = Int(frame.size.width)
        if collectionWidth == 0 {
            return 0
        }
        return CGFloat(Int((collectionWidth - (itemsPerRow + 1) * Int(inset)) / itemsPerRow))
    }

    public func setItemSize(_ size: CGSize) {
        if size.width == 0 || size.height == 0 {
            return
        }
        let layout = (self.collectionViewLayout as? UICollectionViewFlowLayout)!
        layout.itemSize = size
    }
}
