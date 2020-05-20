//
//  WKWebView+Ext.swift
//  CocoaUI
//
//  Created by Prashant Shrestha on 5/18/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit
import WebKit

public extension WKWebView {

// Call this function when WKWebView finish loading
    func exportAsPdfFromWebView(title: String) -> String {
        let pdfData = createPdfFile(printFormatter: self.viewPrintFormatter())
        return self.saveWebViewPdf(title: title, data: pdfData)
    }

    func createPdfFile(printFormatter: UIViewPrintFormatter) -> NSMutableData {
        let page = CGRect(x: 0, y: 0, width: 595.2, height: 841.8) // A4, 72 dpi
        let printable = page.insetBy(dx: 0, dy: 0)
    
        let printPageRenderer = UIPrintPageRenderer()
        printPageRenderer.addPrintFormatter(printFormatter, startingAtPageAt: 0)

        printPageRenderer.setValue(NSValue(cgRect: page), forKey: "paperRect")
        printPageRenderer.setValue(NSValue(cgRect: printable), forKey: "printableRect")
    
        return printPageRenderer.generatePdfData()
    }

    // Save pdf file in document directory
    func saveWebViewPdf(title: String, data: NSMutableData) -> String {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDirectoryPath = paths[0]
        let pdfPath = docDirectoryPath.appendingPathComponent("\(title).pdf")
        if data.write(to: pdfPath, atomically: true) {
            return pdfPath.path
        } else {
            return ""
        }
    }
}

extension UIPrintPageRenderer {
    func generatePdfData() -> NSMutableData {
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, self.paperRect, nil)
        self.prepare(forDrawingPages: NSMakeRange(0, self.numberOfPages))
        let printRect = UIGraphicsGetPDFContextBounds()
        for pdfPage in 0..<self.numberOfPages {
            UIGraphicsBeginPDFPage()
            self.drawPage(at: pdfPage, in: printRect)
        }
        UIGraphicsEndPDFContext();
        return pdfData
    }
}
