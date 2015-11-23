//
//  ViewController.swift
//  EZLoadingActivity
//
//  Created by Goktug Yilmaz on 22/11/15.
//  Copyright © 2015 Goktug Yilmaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        EZLoadingActivity.showWithDelay("Testing..", disableUI: false, seconds: 3)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

