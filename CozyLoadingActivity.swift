//
//  CozyLoadingActivity.swift
//  Cozy
//
//  Created by Goktug Yilmaz on 02/06/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//

import UIKit

struct CozyLoadingActivity {
    
    //==========================================================================================================
    // Feel free to edit these variables
    //==========================================================================================================
    struct Settings {
        static var CLABackgroundColor = UIColor(red: 227/255, green: 232/255, blue: 235/255, alpha: 1.0)
        static var CLAActivityColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        static var CLATextColor = UIColor(red: 80/255, green: 80/255, blue: 80/255, alpha: 1.0)
        static var CLAFontName = "HelveticaNeue-Light"
        // Other possible stuff: ✓ ✓ ✔︎ ✕ ✖︎ ✘
        static var CLASuccessIcon = "✔︎"
        static var CLAFailIcon = "✘"
        static var CLASuccessText = "Success"
        static var CLAFailText = "Failure"
        static var CLASuccessColor = UIColor(red: 68/255, green: 118/255, blue: 4/255, alpha: 1.0)
        static var CLAFailColor = UIColor(red: 255/255, green: 75/255, blue: 56/255, alpha: 1.0)
    }

    private static var instance: LoadingActivity?
    
    /// Disable UI stops users touch actions until CozyLoadingActivity is hidden.
    static func show(text: String, sender: UIViewController, disableUI: Bool) {
        if instance == nil {
            instance = LoadingActivity(text: text, sender: sender, disableUI: disableUI)
        } else {
            print("CozyLoadingActivity: You still have an active activity, please stop that before creating a new one")
        }
    }
    
    static func hide(success success: Bool, animated: Bool) {
        if instance != nil {
            instance?.hideLoadingActivity(success: success, animated: animated)
        } else {
            print("CozyLoadingActivity: You don't have an activity instance")
        }
    }

    private class LoadingActivity: UIView {
        var textLabel: UILabel!
        var activityView: UIActivityIndicatorView!
        var icon: UILabel!
        var UIDisabled = false
        
        convenience init(text: String, sender: UIViewController, disableUI: Bool) {
            let width = sender.view.frame.width / 1.6
            let height = width / 3
            self.init(frame: CGRect(x: sender.view.frame.midX - width/2, y: sender.view.frame.midY - height/2, width: width, height: height)) // height*2 /2 olmali view size duzelince
            backgroundColor = Settings.CLABackgroundColor
            alpha = 1
            layer.cornerRadius = 8
            createShadow()
            
            let yPosition = frame.height/2 - 20
            
            activityView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
            activityView.frame = CGRect(x: 10, y: yPosition, width: 40, height: 40)
            activityView.color = Settings.CLAActivityColor
            activityView.startAnimating()
            
            textLabel = UILabel(frame: CGRect(x: 60, y: yPosition, width: width - 70, height: 40))
            textLabel.textColor = Settings.CLATextColor
            textLabel.font = UIFont(name: Settings.CLAFontName, size: 30)
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
            let myBezier = UIBezierPath()
            myBezier.moveToPoint(CGPoint(x: -3, y: -3))
            myBezier.addLineToPoint(CGPoint(x: frame.width + 3, y: -3))
            myBezier.addLineToPoint(CGPoint(x: frame.width + 3, y: frame.height + 3))
            myBezier.addLineToPoint(CGPoint(x: -3, y: frame.height + 3))
            myBezier.closePath()
            return myBezier
        }
        
        func hideLoadingActivity(success success: Bool, animated: Bool) {
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
            icon.font = UIFont(name: Settings.CLAFontName, size: 60)
            icon.textAlignment = NSTextAlignment.Center
            
            if animated {
                textLabel.fadeTransition(animationDuration)
            }
            
            if success {
                icon.textColor = Settings.CLASuccessColor
                icon.text = Settings.CLASuccessIcon
                textLabel.text = Settings.CLASuccessText
            } else {
                icon.textColor = Settings.CLAFailColor
                icon.text = Settings.CLAFailIcon
                textLabel.text = Settings.CLAFailText
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
}

private extension UIView {
    /// Cozy extension: insert view.fadeTransition right before changing content
    func fadeTransition(duration: CFTimeInterval) {
        let animation: CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = kCATransitionFade
        animation.duration = duration
        self.layer.addAnimation(animation, forKey: kCATransitionFade)
    }
}

private extension NSObject {
    /// Cozy extension
    func callSelectorAsync(selector: Selector, delay: NSTimeInterval) {
        let timer = NSTimer.scheduledTimerWithTimeInterval(delay, target: self, selector: selector, userInfo: nil, repeats: false)
        NSRunLoop.mainRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
    }
}
