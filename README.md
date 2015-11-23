EZLoadingActivity
==========
Lightweight Swift loading activity for iOS7+. Really simple to use, just add the class and write 1 line of code. 

![demo](http://i.imgur.com/xLHKvSB.gif)

## Easy to use:
```swift
EZLoadingActivity.show("Loading...", disableUI: true)
```
'disableUI' stops user interactions until you hide loadingactivity.  

## How to dismiss:
```swift
EZLoadingActivity.hide(success: true, animated: true)
```

## Failure:
```swift
EZLoadingActivity.hide(success: false, animated: true)
```
![demo](http://i.imgur.com/x2BAEmG.gif)

## Without Animation:
```swifts
EZLoadingActivity.hide(success: true, animated: false)
```
![demo](http://i.imgur.com/fXvCbIy.gif)

## Hide Directly:
```swift
EZLoadingActivity.hide()
```
![demo](http://i.imgur.com/2cySGp6.gif)

## Editing:
```swift
EZLoadingActivity.Settings.SuccessColor = UIColor.blueColor()
EZLoadingActivity.show("Loading...", disableUI: false)
```

|Settings Options|
| -------------|
|BackgroundColor|
|ActivityColor|
|TextColor|
|FontName|
|SuccessIcon|
|FailIcon|
|SuccessText|
|FailText|
|SuccessColor|
|FailColor|

## Example Use Case:

```swift
EZLoadingActivity.show("Uploading...", disableUI: false)

var postObject = PFObject(className: "className")
postObject.saveInBackgroundWithBlock { (succeeded: Bool, error: NSError!) -> Void in
    if error == nil {
       if succeeded == true {
          EZLoadingActivity.hide(success: true, animated: false)
          print("Upload Complete")
        } else {
          EZLoadingActivity.hide(success: false, animated: true)
          print("Upload Failed")
       }
    } else {
        EZLoadingActivity.hide(success: false, animated: true)
        print("Error")
    }
}
```

######Showing EZLoadingActivity for a certain time:

```swift
EZLoadingActivity.showWithDelay("Waiting...", disableUI: false, seconds: 2)
```

## No object tracking:
EZLoadingActivity is a singleton object so you don't need to keep track of its instance.  

##Installation (~10 seconds)

1. Download and drop 'EZLoadingActivity.swift' in your project.  
2. Congratulations!  

## Install via CocoaPods

You can use [Cocoapods](http://cocoapods.org/) to install `EZLoadingActivity` by adding it to your `Podfile`:

```ruby
platform :ios, '8.0'
use_frameworks!

pod 'EZLoadingActivity'
```

Then on the top of files where you are going to use this:

```swift
import EZLoadingActivity
```

##Requirements

- Xcode 6 or later (Tested on 7)
- iOS 7 or later (Tested on 9)

##Possible features

- More customization
- Pod support 
- OSX compatibility and add here https://github.com/AndrewSB/awesome-osx

##License
EZLoadingActivity is available under the MIT license. See the [LICENSE file](https://github.com/goktugyil/EZLoadingActivity/blob/master/LICENSE).

##Keywords
swift, hud, loading, activity, progresshud, progress, track, spinner,
