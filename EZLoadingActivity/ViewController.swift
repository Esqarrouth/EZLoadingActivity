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
        let _button = UIButton(type: .system)
        _button.setTitle("Show EZLoadingActivity", for: .normal)
        _button.addTarget(self, action: #selector(ViewController.showLoadingActivity(_:)), for: .touchUpInside)
        return _button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)

        if #available(iOS 9.0, *) {
            button.translatesAutoresizingMaskIntoConstraints = false
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        } else {
            button.sizeToFit()
            button.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
            button.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleBottomMargin, .flexibleRightMargin]
        }
    }

    @IBAction func showLoadingActivity(_ sender: UIButton) {
        EZLoadingActivity.showWithDelay("Testing..", disableUI: false, seconds: 3)
    }

}
