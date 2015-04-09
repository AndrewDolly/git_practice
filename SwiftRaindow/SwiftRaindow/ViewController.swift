//
//  ViewController.swift
//  SwiftRaindow
//
//  Created by andrew dahle on 4/7/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

import UIKit

enum RainbowColor : Int{
    case Red
    case Orange
    case Yellow
    case Green
    case Blue
    case Indigo
    case Violet

    func text() -> String{
        switch self {
        case .Red: return "Red"
        case .Orange: return "Orange"
        case .Yellow: return "Yellow"
        case .Green: return "Green"
        case .Blue: return "Blue"
        case .Indigo: return "Indigo"
        default: return "Violet"
        }
    }
    func color() -> UIColor {
        switch self {
        case .Red: return UIColor.redColor()
        case .Orange: return UIColor.orangeColor()
        case .Yellow: return UIColor.yellowColor()
        case .Green: return UIColor.greenColor()
        case .Blue: return UIColor.blueColor()
        case .Indigo: return UIColor.purpleColor()
        default: return UIColor(red: 0.451, green: 0.400, blue: 0.741, alpha: 1.0)
        }
    }
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let colors = [UIColor.redColor(), UIColor.greenColor(), UIColor.blueColor()]



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    //the use of UITableViewCell() at the end is a constructor, it goes ahead and calls init for you
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellID") as UITableViewCell


        if let rainbowcolor = RainbowColor(rawValue: indexPath.row){
            cell.textLabel!.text = rainbowcolor.text()
            cell.backgroundColor = rainbowcolor.color()
        }

        return cell
    }
}

