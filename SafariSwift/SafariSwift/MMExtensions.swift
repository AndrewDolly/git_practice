//
//  MMExtensions.swift
//  SafariSwift
//
//  Created by andrew dahle on 4/8/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

import Foundation
import UIKit

extension UIWebView
{
    func loadRequestWithString(#theString:String)
    {
        let addressURL = NSURL(string: theString)
        let addressRequest = NSURLRequest(URL: addressURL!)
        self.loadRequest(addressRequest)
    }
}
