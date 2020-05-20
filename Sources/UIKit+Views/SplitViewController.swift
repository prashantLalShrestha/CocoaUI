//
//  SplitViewController.swift
//  CocoaUI
//
//  Created by Prashant Shrestha on 5/18/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit

public class SplitViewController: UISplitViewController {


    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        delegate = self
        preferredDisplayMode = .allVisible
    }
}

extension SplitViewController: UISplitViewControllerDelegate {

    public func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
