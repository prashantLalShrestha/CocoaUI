//
//  NavigationController.swift
//  CocoaUI
//
//  Created by Prashant Shrestha on 5/18/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit

open class NavigationController: UINavigationController {
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }

    // MARK: - Lifecycle
    
    public convenience init() {
        self.init(nibName: nil, bundle: nil)
        delegate = self
    }

    override public init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        delegate = self
    }

    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        delegate = self
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        delegate = self
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.isTranslucent = false

        // This needs to be in here, not in init
        interactivePopGestureRecognizer?.delegate = self
    }

    deinit {
        delegate = nil
        interactivePopGestureRecognizer?.delegate = nil
    }

    // MARK: - Overrides

    open override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        duringPushAnimation = true

        super.pushViewController(viewController, animated: animated)
    }

    // MARK: - Private Properties

    fileprivate var duringPushAnimation = false

}

// MARK: - UINavigationControllerDelegate

extension NavigationController: UINavigationControllerDelegate {

    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let swipeNavigationController = navigationController as? NavigationController else { return }

        swipeNavigationController.duringPushAnimation = false
    }

}

// MARK: - UIGestureRecognizerDelegate

extension NavigationController: UIGestureRecognizerDelegate {

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard gestureRecognizer == interactivePopGestureRecognizer else {
            return true // default value
        }

        // Disable pop gesture in two situations:
        // 1) when the pop animation is in progress
        // 2) when user swipes quickly a couple of times and animations don't have time to be performed
        return viewControllers.count > 1 && duringPushAnimation == false
    }
}
