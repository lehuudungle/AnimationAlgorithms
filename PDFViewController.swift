//
//  PDFViewController.swift
//  Algorithms
//
//  Created by Loc Tran on 4/17/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class PDFViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let pdfTitle = PDF_TITLE
        
        let url = Bundle.main.url(forResource: pdfTitle, withExtension: "pdf")
        
        let webView = UIWebView(frame: view.frame)
        let urlRequest = URLRequest(url: url!)
        
        webView.loadRequest(urlRequest as URLRequest)
        webView.scalesPageToFit = true
        
        view.addSubview(webView)
        title = pdfTitle
    }
}
