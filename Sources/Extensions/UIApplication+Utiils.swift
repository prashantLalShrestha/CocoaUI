//
//  UIApplication+Utiils.swift
//  CocoaUI
//
//  Created by Prashant Shrestha on 5/18/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit
import StoreKit

public extension UIApplication {
    func openUrl(string: String, completionHandler: ((Bool) -> Void)? = nil){
        guard let url = URL(string: string) else {
            completionHandler?(false)
            return
        }
        guard canOpenURL(url) else {
            completionHandler?(true)
            return
        }
        if #available(iOS 10.0, *) {
            open(url, completionHandler: completionHandler)
        } else {
            let status = openURL(url)
            completionHandler?(status)
        }
    }
    
    func makeCall(_ phoneNumber: String) {
        openUrl(string: "tel://\(phoneNumber)")
    }
    
    func openGoogleMap(latitude: String, longitude: String) {
        openUrl(string: "comgooglemaps://?q=\(latitude),\(longitude)") { success in
            if success == false {
                self.openUrl(string: "https://maps.google.com/maps/?q=\(latitude),\(longitude)")
            }
        }
    }
    
    func openMessenger(_ messengerId: String) {
        openUrl(string: "fb-messenger://user-thread/\(messengerId)")
    }
    
    func openFacebook(pageId: String, pageUrl: String) {
        openUrl(string: "fb://profile/\(pageId)") { success in
            if success == false {
                self.openUrl(string: pageUrl)
            }
        }
    }
    
    func openSettingsApp() {
        openUrl(string: UIApplication.openSettingsURLString)
    }
    
    func rateApp() {
        if #available( iOS 10.3,*){
            SKStoreReviewController.requestReview()
        }
    }
    
    func shareApp(appStoreURL: String, message: String, parentVC: UIViewController) {
        let textToShare = message
        
        if let myWebsite = NSURL(string: appStoreURL) {
            let objectsToShare: [Any] = [textToShare, myWebsite]
               let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)

               //New Excluded Activities Code
            activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]

            activityVC.popoverPresentationController?.sourceView = parentVC.view
            parentVC.present(activityVC, animated: true, completion: nil)
        }
    }
    
    func topMostViewController() -> UIViewController? {
        return self.keyWindow?.rootViewController?.topMostViewController()
    }
}
