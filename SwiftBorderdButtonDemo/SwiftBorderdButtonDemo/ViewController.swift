//
//  ViewController.swift
//  SwiftBorderdButtonDemo
//
//  Created by daisuke yamanaka on 2015/05/23.
//  Copyright (c) 2015年 triaedz. All rights reserved.
//

import UIKit
import SwiftBorderdButton

class ViewController: UIViewController {

    @IBOutlet weak var borderedButton1: BorderdButton!
    @IBOutlet weak var borderedButton2: BorderdButton!
    @IBOutlet weak var stateSwitch1: UISwitch!
    @IBOutlet weak var stateSwitch2: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stateSwitch1.addTarget(self, action: "switchState:", forControlEvents: UIControlEvents.ValueChanged)
        stateSwitch2.addTarget(self, action: "switchState:", forControlEvents: UIControlEvents.ValueChanged)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func switchState(sender: AnyObject) {
        if sender .isEqual(stateSwitch1) {
            if borderedButton1.enabled {
                borderedButton1.enabled = false
            } else {
                borderedButton1.enabled = true
            }
        } else if sender .isEqual(stateSwitch2) {
            if borderedButton2.enabled {
                borderedButton2.enabled = false
            } else {
                borderedButton2.enabled = true
            }
        }
    }
    
}

