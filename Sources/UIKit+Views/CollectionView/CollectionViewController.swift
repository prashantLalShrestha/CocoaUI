//
//  CollectionViewController.swift
//  SwiftHub
//
//  Created by Khoren Markosyan on 1/4/17.
//  Copyright © 2017 Khoren Markosyan. All rights reserved.
//

import UIKit

open class CollectionViewController: ViewController {

    public lazy var collectionView: CollectionView = {
        let view = CollectionView()
        return view
    }()

    public var clearsSelectionOnViewWillAppear = true

    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if clearsSelectionOnViewWillAppear == true {
            deselectSelectedItems()
        }
    }

    override open func makeUI() {
        super.makeUI()

        stackView.spacing = 0
        stackView.insertArrangedSubview(collectionView, at: 0)
    }
}

public extension CollectionViewController {

    func deselectSelectedItems() {
        if let selectedIndexPaths = collectionView.indexPathsForSelectedItems {
            selectedIndexPaths.forEach({ (indexPath) in
                collectionView.deselectItem(at: indexPath, animated: false)
            })
        }
    }
}
