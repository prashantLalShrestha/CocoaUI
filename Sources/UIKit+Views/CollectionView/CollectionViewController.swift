//
//  CollectionViewController.swift
//  SwiftHub
//
//  Created by Khoren Markosyan on 1/4/17.
//  Copyright © 2017 Khoren Markosyan. All rights reserved.
//

import UIKit

public class CollectionViewController: ViewController {

    public lazy var collectionView: CollectionView = {
        let view = CollectionView()
        return view
    }()

    public var clearsSelectionOnViewWillAppear = true

    override public func viewDidLoad() {
        super.viewDidLoad()
    }

    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if clearsSelectionOnViewWillAppear == true {
            deselectSelectedItems()
        }
    }

    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override public func makeUI() {
        super.makeUI()

        stackView.spacing = 0
        stackView.insertArrangedSubview(collectionView, at: 0)
    }

    override public func updateUI() {
        super.updateUI()
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
