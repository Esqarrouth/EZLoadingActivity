//
//  ViewController.swift
//  EZLoadingActivity
//
//  Created by Goktug Yilmaz on 22/11/15.
//  Copyright © 2015 Goktug Yilmaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var button: UIButton = {
        let _button = UIButton(type: .System)
        _button.setTitle("Show EZLoadingActivity", forState: .Normal)
        _button.addTarget(self, action: #selector(ViewController.showLoadingActivity(_:)), forControlEvents: .TouchUpInside)
        return _button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)

        if #available(iOS 9.0, *) {
            button.translatesAutoresizingMaskIntoConstraints = false
            button.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
            button.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor).active = true
        } else {
            button.sizeToFit()
            button.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
            button.autoresizingMask = [.FlexibleTopMargin, .FlexibleLeftMargin, .FlexibleBottomMargin, .FlexibleRightMargin]
        }
    }

    @IBAction func showLoadingActivity(sender: UIButton) {
        EZLoadingActivity.showWithDelay("Testing..", disableUI: false, seconds: 3)
    }

}
