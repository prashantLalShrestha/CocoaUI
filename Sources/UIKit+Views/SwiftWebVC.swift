//
//  SwiftWebVC.swift
//  CocoaUI
//
//  Created by Prashant Shrestha on 5/18/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import WebKit

public protocol SwiftWebVCDelegate: class {
    func didStartLoading(webView: SwiftWebVC)
    func didFinishLoading(webView: SwiftWebVC, success: Bool)
    func url(webView: SwiftWebVC, url: String?)
}

extension SwiftWebVCDelegate {
    func didStartLoading(webView: SwiftWebVC) { }
    func didFinishLoading(webView: SwiftWebVC, success: Bool) { }
    func url(webView: SwiftWebVC, url: String?) { }
}

public class SwiftWebVC: ViewController {
    
    public weak var delegate: SwiftWebVCDelegate?
    var storedStatusColor: UIBarStyle?
    var buttonColor: UIColor? = nil
    var titleColor: UIColor? = nil
    var closing: Bool! = false
    
    lazy var refreshBarButtonItem: UIBarButtonItem = {
        var tempRefreshBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.refresh,
                                                       target: self,
                                                       action: #selector(SwiftWebVC.reloadTapped(_:)))
        tempRefreshBarButtonItem.tintColor = self.buttonColor
        return tempRefreshBarButtonItem
    }()
    
    lazy var stopBarButtonItem: UIBarButtonItem = {
        var tempStopBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.stop,
                                                    target: self,
                                                    action: #selector(SwiftWebVC.stopTapped(_:)))
        tempStopBarButtonItem.tintColor = self.buttonColor
        return tempStopBarButtonItem
    }()
    
    
    public lazy var webView: WKWebView = {
        var tempWebView = WKWebView(frame: UIScreen.main.bounds)
        tempWebView.uiDelegate = self
        tempWebView.navigationDelegate = self
        return tempWebView;
    }()
    
    lazy var progressView: UIProgressView = {
        let view = UIProgressView(progressViewStyle: .default)
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 3)
        view.sizeToFit()
        return view
    }()
    
    var request: URLRequest!
    
    var navBarTitle: UILabel!
    
    ////////////////////////////////////////////////
    
    deinit {
        webView.stopLoading()
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        webView.uiDelegate = nil;
        webView.navigationDelegate = nil;
    }
    
    public convenience init(urlString: String, sharingEnabled: Bool = true) {
        var urlString = urlString
        if !urlString.hasPrefix("https://") && !urlString.hasPrefix("http://") {
            urlString = "https://"+urlString
        }
        self.init(pageURL: URL(string: urlString)!, sharingEnabled: sharingEnabled)
    }
    
    public convenience init(pageURL: URL, sharingEnabled: Bool = true) {
        let request = URLRequest(url: pageURL, timeoutInterval: 30.0)
        self.init(aRequest: request, sharingEnabled: sharingEnabled)
    }
    
    public convenience init(aRequest: URLRequest, sharingEnabled: Bool = true) {
        self.init()
        self.request = aRequest
    }
    
    func loadRequest(_ request: URLRequest) {
        webView.load(request)
    }
    
    ////////////////////////////////////////////////
    // View Lifecycle
    
    override public func loadView() {
        view = webView
        view.addSubview(progressView)
        loadRequest(request)
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.url), options: .new, context: nil)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override public func viewWillAppear(_ animated: Bool) {
//        assert(self.navigationController != nil, "SVWebViewController needs to be contained in a UINavigationController. If you are presenting SVWebViewController modally, use SVModalWebViewController instead.")
        
        updateToolbarItems()
        navBarTitle = UILabel()
        navBarTitle.backgroundColor = UIColor.clear
        if presentingViewController == nil {
            if let titleAttributes = navigationController!.navigationBar.titleTextAttributes {
                navBarTitle.textColor = titleAttributes[.foregroundColor] as? UIColor
            }
        }
        else {
            navBarTitle.textColor = self.titleColor
        }
        navBarTitle.shadowOffset = CGSize(width: 0, height: 1);
        navBarTitle.font = UIFont(name: "HelveticaNeue-Medium", size: 17.0)
        navBarTitle.textAlignment = .center
        navigationItem.titleView = navBarTitle;
        
        super.viewWillAppear(true)
    }
    
    override public func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    ////////////////////////////////////////////////
    // Toolbar
    
    func updateToolbarItems() {
        let refreshStopBarButtonItem: UIBarButtonItem = webView.isLoading ? stopBarButtonItem : refreshBarButtonItem
        let items: NSArray = [refreshStopBarButtonItem]
        navigationItem.rightBarButtonItems = items.reverseObjectEnumerator().allObjects as? [UIBarButtonItem]
    }
    
    
    ////////////////////////////////////////////////
    // Target Actions
    
    @objc func reloadTapped(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
    @objc func stopTapped(_ sender: UIBarButtonItem) {
        webView.stopLoading()
        updateToolbarItems()
    }
    
    ////////////////////////////////////////////////
    
    @objc func doneButtonTapped() {
        closing = true
        UINavigationBar.appearance().barStyle = storedStatusColor!
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Class Methods
    /// Helper function to get image within SwiftWebVCResources bundle
    ///
    /// - parameter named: The name of the image in the SwiftWebVCResources bundle
    class func bundledImage(named: String) -> UIImage? {
        let image = UIImage(named: named)
        if image == nil {
            return UIImage(named: named, in: Bundle(for: SwiftWebVC.classForCoder()), compatibleWith: nil)
        } // Replace MyBasePodClass with yours
        return image
    }
    
}

extension SwiftWebVC: WKUIDelegate {
    
    // Add any desired WKUIDelegate methods here: https://developer.apple.com/reference/webkit/wkuidelegate
    
    override public func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(WKWebView.estimatedProgress) {
            progressView.progress = Float(webView.estimatedProgress)
        }
        if keyPath == #keyPath(WKWebView.url) {
            delegate?.url(webView: self, url: webView.url?.absoluteString)
        }
    }
    
}

extension SwiftWebVC: WKNavigationDelegate {
    
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.delegate?.didStartLoading(webView: self)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        updateToolbarItems()
        progressView.alpha = 1.0
    }
    
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.delegate?.didFinishLoading(webView: self, success: true)
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
        webView.evaluateJavaScript("document.title", completionHandler: {(response, error) in
            self.navBarTitle.text = response as! String?
            self.navBarTitle.sizeToFit()
            self.updateToolbarItems()
        })
        progressView.alpha = 0.0
    }
    
    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.delegate?.didFinishLoading(webView: self, success: false)
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        updateToolbarItems()
        progressView.alpha = 0.0
    }
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        let url = navigationAction.request.url
        
        let hostAddress = navigationAction.request.url?.host
        
        if (navigationAction.targetFrame == nil) {
            if UIApplication.shared.canOpenURL(url!) {
                UIApplication.shared.open(url!, options: [:], completionHandler: nil)
            }
        }
        
        // To connnect app store
        if hostAddress == "itunes.apple.com" {
            if UIApplication.shared.canOpenURL(navigationAction.request.url!) {
                UIApplication.shared.open(navigationAction.request.url!, options: [:], completionHandler: nil)
                decisionHandler(.cancel)
                return
            }
        }
        
        let url_elements = url!.absoluteString.components(separatedBy: ":")
        
        switch url_elements[0] {
        case "tel":
            openCustomApp(urlScheme: "telprompt://", additional_info: url_elements[1])
            decisionHandler(.cancel)
            
        case "sms":
            openCustomApp(urlScheme: "sms://", additional_info: url_elements[1])
            decisionHandler(.cancel)
            
        case "mailto":
            openCustomApp(urlScheme: "mailto://", additional_info: url_elements[1])
            decisionHandler(.cancel)
            
        default:
            //print("Default")
            break
        }
        
        decisionHandler(.allow)
        
    }
    
    func openCustomApp(urlScheme: String, additional_info:String){
        
        if let requestUrl: URL = URL(string:"\(urlScheme)"+"\(additional_info)") {
            let application:UIApplication = UIApplication.shared
            if application.canOpenURL(requestUrl) {
                UIApplication.shared.open(requestUrl, options: [:], completionHandler: nil)
            }
        }
    }
}
