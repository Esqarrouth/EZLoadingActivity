//
//  CozyLoadingActivity.swift
//  Cozy
//
//  Created by Goktug Yilmaz on 02/06/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//  License Non-third party files are licensed under the WTFPL; terms and conditions can be found at: http://www.wtfpl.net/about/

import UIKit

class CozyLoadingActivity: UIView {
    //==========================================================================================================
    /// Feel free to edit these variables
    //==========================================================================================================
    let CLABackgroundColor = UIColor(red: 227/255, green: 232/255, blue: 235/255, alpha: 1.0)
    let CLAActivityColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
    let CLATextColor = UIColor(red: 80/255, green: 80/255, blue: 80/255, alpha: 1.0)
    let CLAFontName = "HelveticaNeue-Light"
    let CLASuccessIcon = "✔︎"
    let CLAFailIcon = "✘"
    let CLASuccessText = "Success"
    let CLAFailText = "Failure"
    let CLASuccessColor = UIColor(red: 68/255, green: 118/255, blue: 4/255, alpha: 1.0)
    let CLAFailColor = UIColor(red: 255/255, green: 75/255, blue: 56/255, alpha: 1.0)
    /*
    Other possible stuff:
    ✓
    ✓
    ✔︎
    ✕
    ✖︎
    ✘
    */
    //==========================================================================================================
    /// Do not change the stuff below unless you know what you are doing
    //==========================================================================================================
    var textLabel: UILabel!
    var activityView: UIActivityIndicatorView!
    var icon: UILabel!
    var UIDisabled = false
    
    convenience init(text: String, sender: UIViewController, disableUI: Bool) {
        let screenWidth = UIScreen.mainScreen().bounds.size.width

        let width = sender.view.frame.width / 1.6
        let height = width / 3
        self.init(frame: CGRect(x: sender.view.frame.midX - width/2, y: sender.view.frame.midY - height/2, width: width, height: height))
        backgroundColor = CLABackgroundColor
        alpha = 1
        layer.cornerRadius = 8
        createShadow()

        var yPosition = frame.height/2 - 20
        
        activityView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
        activityView.frame = CGRect(x: 10, y: yPosition, width: 40, height: 40)
        activityView.color = CLAActivityColor
        activityView.startAnimating()
        
        textLabel = UILabel(frame: CGRect(x: 60, y: yPosition, width: width - 70, height: 40))
        textLabel.textColor = CLATextColor
        textLabel.font = UIFont(name: CLAFontName, size: 30)
        textLabel.adjustsFontSizeToFitWidth = true
        textLabel.minimumScaleFactor = 0.25
        textLabel.textAlignment = NSTextAlignment.Center
        textLabel.text = text
        
        addSubview(activityView)
        addSubview(textLabel)
        
        sender.view.addSubview(self)
        
        if disableUI {
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
            UIDisabled = true
        }
    }
    
    func createShadow() {
        layer.shadowPath = createShadowPath().CGPath
        layer.masksToBounds = false
        layer.shadowColor = UIColor.blackColor().CGColor
        layer.shadowOffset = CGSizeMake(0, 0)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.5
    }
    
    func createShadowPath() -> UIBezierPath {
        var myBezier = UIBezierPath()
        myBezier.moveToPoint(CGPoint(x: -3, y: -3))
        myBezier.addLineToPoint(CGPoint(x: frame.width + 3, y: -3))
        myBezier.addLineToPoint(CGPoint(x: frame.width + 3, y: frame.height + 3))
        myBezier.addLineToPoint(CGPoint(x: -3, y: frame.height + 3))
        myBezier.closePath()
        return myBezier
    }

    func hideLoadingActivity(#success: Bool, animated: Bool) {
        if UIDisabled {
            UIApplication.sharedApplication().endIgnoringInteractionEvents()
        }

        var animationDuration: Double!
        if success {
            animationDuration = 0.5
        } else {
            animationDuration = 1
        }
        
        icon = UILabel(frame: CGRect(x: 10, y: frame.height/2 - 20, width: 40, height: 40))
        icon.font = UIFont(name: CLAFontName, size: 60)
        icon.textAlignment = NSTextAlignment.Center
        
        if animated {
            textLabel.fadeTransition(animationDuration)
        }
        
        if success {
            icon.textColor = CLASuccessColor
            icon.text = CLASuccessIcon
            textLabel.text = CLASuccessText
        } else {
            icon.textColor = CLAFailColor
            icon.text = CLAFailIcon
            textLabel.text = CLAFailText
        }
        addSubview(icon)

        if animated {
            icon.alpha = 0
            activityView.stopAnimating()
            UIView.animateWithDuration(animationDuration, animations: {
                self.icon.alpha = 1
            }, completion: { (value: Bool) in
                self.callSelectorAsync("removeFromSuperview", delay: animationDuration)
            })
        } else {
            activityView.stopAnimating()
            self.callSelectorAsync("removeFromSuperview", delay: animationDuration)
        }
    }

}

// Source: http://stackoverflow.com/questions/3073520/setting-new-text-to-uilabel-and-animation
extension UIView {
    
    /// Cozy extension: insert view.fadeTransition right before changing content
    func fadeTransition(duration: CFTimeInterval) {
        let animation: CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = kCATransitionFade
        animation.duration = duration
        self.layer.addAnimation(animation, forKey: kCATransitionFade)
    }
    
}

// Source: http://stackoverflow.com/questions/24170282/swift-performselector-withobject-afterdelay
extension NSObject {
    
    /// Cozy extension
    func callSelectorAsync(selector: Selector, delay: NSTimeInterval) {
        var timer = NSTimer.scheduledTimerWithTimeInterval(delay, target: self, selector: selector, userInfo: nil, repeats: false)
    }
    
}
