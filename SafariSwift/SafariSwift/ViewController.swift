//
//  ViewController.swift
//  SafariSwift
//
//  Created by andrew dahle on 4/8/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!


    override func viewDidLoad() {
        super.viewDidLoad()
        webView.loadRequestWithString(theString: "http://www.mobilemakers.co")
        webView.delegate = self


    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        webView.loadRequestWithString(theString: textField.text)
        return true
    }

    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        let alertController = UIAlertController(title: "Error", message: "Sure didn't work", preferredStyle: UIAlertControllerStyle.Alert)
        let homeAction = UIAlertAction(title: "Home", style: UIAlertActionStyle.Default) { (action) -> Void in webView.loadRequestWithString(theString: "http://www.mobilemakers.co")
    }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (action) -> Void in
            //do nothing
        }
        alertController.addAction(homeAction)
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true) { () -> Void in
            //
        }
    }
    func webViewDidStartLoad(webView: UIWebView) {
        spinner.startAnimating()
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        spinner.stopAnimating()
    }

}