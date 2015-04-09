//
//  ViewController.swift
//  IntergalacticTravelSwift
//
//  Created by andrew dahle on 4/6/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        let vc = segue.destinationViewController as VacaViewController
        vc.title = sender?.currentTitle

        vc.isBlueStar = (segue.identifier != "RedDwarfSegue")
}
}