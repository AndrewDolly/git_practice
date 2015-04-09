//
//  VacaViewController.swift
//  IntergalacticTravelSwift
//
//  Created by andrew dahle on 4/6/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

import UIKit

class VacaViewController: UIViewController {

    var isBlueStar  :  Bool = false


    @IBOutlet weak var intergalacticImageView: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()

        if isBlueStar {
            view.backgroundColor = UIColor.blueColor()
            intergalacticImageView.image = UIImage(named: "bluestar 2")
        }
        else {
            view.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
            intergalacticImageView.image = UIImage(named: "reddwarf 2")

        }

    }
    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
