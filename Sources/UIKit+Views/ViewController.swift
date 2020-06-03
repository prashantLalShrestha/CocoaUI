//
//  ViewController.swift
//  CocoaUI
//
//  Created by Prashant Shrestha on 5/18/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit
import LocalizeX

open class ViewController: UIViewController, ThemeConfigurable, Localizable {
    
    public var automaticallyAdjustsLeftBarButtonItem = true
    
    public var navigationTitle = "" {
        didSet {
            navigationItem.title = navigationTitle
        }
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    public lazy var contentView: View = {
        let view = View()
        view.backgroundColor = UIColor.white
        self.view.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            view.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
            view.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        } else {
            view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
            view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        }
        return view
    }()
    
    public lazy var stackView: StackView = {
        let subviews: [UIView] = []
        let view = StackView(arrangedSubviews: subviews)
        view.spacing = 0
        self.contentView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
        return view
    }()
    
    private lazy var scrollView: ScrollView = {
        let view = ScrollView()
        view.contentInsetAdjustmentBehavior = .never
        view.showsVerticalScrollIndicator = false
        self.contentView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
        return view
    }()
    
    private lazy var scrollContentView: View = {
        let view = View()
        scrollView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: self.scrollView.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: self.scrollView.rightAnchor).isActive = true
        view.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor).isActive = true
        view.heightAnchor.constraint(greaterThanOrEqualTo: self.scrollView.heightAnchor).isActive = true
        return view
    }()
    
    lazy var disableView: View = {
        let view = View()
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    public var closeBarButtonIcon: UIImage?
    public var backBarButtonIcon: UIImage?
    private lazy var closeBarButton: BarButtonItem = {
        let view = BarButtonItem(image: UIImage.closeImage().scaled(to: CGSize(width: 16, height: 16))?.withRenderingMode(.alwaysTemplate),
                                 style: .plain,
                                 target: self,
                                 action: #selector(closeAction))
        return view
    }()
    public var closeBarAction: (() -> ())?
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.view.backgroundColor = UIColor.white
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        let backImage = UIImage()
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        
        // Do any additional setup after loading the view.
        makeUI()
        bindViewModel()
        languageChanged()
        themeChanged()
        
        // Observe device orientation change
        NotificationCenter.default.addObserver(self, selector: #selector(orientationChanged), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        // Observe application did become active notification
        NotificationCenter.default.addObserver(self, selector: #selector(didBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
        
        // Observe application did change language notification
        self.registerForLocalizeEvent()
        
        self.registerForThemeEvent()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if automaticallyAdjustsLeftBarButtonItem {
            adjustLeftBarButtonItem()
        }
        updateUI()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateUI()
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.view.endEditing(true)
    }
    
    deinit {
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    open func makeUI() {
        updateUI()
    }
    
    open func bindViewModel() {
        
    }
    
    open func updateUI() {
        
    }
    
    open func languageChanged() {
        
    }
    
    open func applyTheme(_ theme: Theme) {
        
    }
    
    @objc open func orientationChanged() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.updateUI()
        }
    }
    
    @objc open func didBecomeActive() {
        self.updateUI()
    }
    
    open func disableView(_ bool: Bool) {
        if bool {
            UIApplication.shared.keyWindow?.addSubview(disableView)
            disableView.translatesAutoresizingMaskIntoConstraints = false
            disableView.topAnchor.constraint(equalTo: UIApplication.shared.keyWindow!.topAnchor).isActive = true
            disableView.bottomAnchor.constraint(equalTo: UIApplication.shared.keyWindow!.bottomAnchor).isActive = true
            disableView.leftAnchor.constraint(equalTo: UIApplication.shared.keyWindow!.leftAnchor).isActive = true
            disableView.rightAnchor.constraint(equalTo: UIApplication.shared.keyWindow!.rightAnchor).isActive = true
        } else {
            disableView.removeFromSuperview()
        }
    }
    
    // MARK: Adjusting Navigation Item
    func adjustLeftBarButtonItem() {
        if self.navigationController?.viewControllers.count ?? 0 > 1 { // Pushed
            closeBarButtonIcon = backBarButtonIcon ?? UIImage.backArrowImage().scaled(to: CGSize(width: 16, height: 16))?.withRenderingMode(.alwaysTemplate)
            if closeBarAction == nil {
                closeBarAction = { [weak self] () in
                    self?.navigationController?.popViewController(animated: true)
                }
            }
        } else  { // presented
            closeBarButtonIcon = closeBarButtonIcon ?? UIImage.closeImage().scaled(to: CGSize(width: 16, height: 16))?.withRenderingMode(.alwaysTemplate)
            if closeBarAction == nil {
                closeBarAction = { [weak self] () in
                    self?.navigationController?.dismiss(animated: true, completion: nil)
                }
            }
        }
        self.navigationItem.leftBarButtonItem = closeBarButton
    }
    
    @objc func closeAction() {
        closeBarAction?()
    }
}
