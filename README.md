CozyLoadingActivity
==========
Lightweight Swift loading activity for iOS7+. Really simple to use, just add the class and write 1 line of code. 

![demo](http://i.imgur.com/xLHKvSB.gif)

## Easy to use:
```swift
CozyLoadingActivity.show("Loading...", disableUI: true)
```
'disableUI' stops user interactions until you hide loadingactivity.  

## How to dismiss:
```swift
CozyLoadingActivity.hide(success: true, animated: true)
```

## Failure:
```swift
CozyLoadingActivity.hide(success: false, animated: true)
```
![demo](http://i.imgur.com/x2BAEmG.gif)

## Without Animation:
```swifts
CozyLoadingActivity.hide(success: true, animated: false)
```
![demo](http://i.imgur.com/fXvCbIy.gif)

## Hide Directly:
```swift
CozyLoadingActivity.hide()
```
![demo](http://i.imgur.com/2cySGp6.gif)

## Editing:
```swift
CozyLoadingActivity.Settings.CLASuccessColor = UIColor.blueColor()
CozyLoadingActivity.show("Loading...", disableUI: false)
```

|Settings Options|
| -------------|
|CLABackgroundColor|
|CLAActivityColor|
|CLATextColor|
|CLAFontName|
|CLASuccessIcon|
|CLAFailIcon|
|CLASuccessText|
|CLAFailText|
|CLASuccessColor|
|CLAFailColor|

## Example Use Case:

```swift
CozyLoadingActivity.show("Uploading...", disableUI: false)

var postObject = PFObject(className: "className")
postObject.saveInBackgroundWithBlock { (succeeded: Bool, error: NSError!) -> Void in
    if error == nil {
       if succeeded == true {
          CozyLoadingActivity.hide(success: true, animated: false)
          print("Upload Complete")
        } else {
          CozyLoadingActivity.hide(success: false, animated: true)
          print("Upload Failed")
       }
    } else {
        CozyLoadingActivity.hide(success: false, animated: true)
        print("Error")
    }
}
```

######Showing CozyLoadingActivity for a certain time:

```swift
CozyLoadingActivity.showWithDelay("Waiting...", disableUI: false, seconds: 2)
```

## No object tracking:
CozyLoadingActivity is a singleton object so you don't need to keep track of its instance.  

##Installation (~10 seconds)

1. Download and drop 'CozyLoadingActivity.swift' in your project.  
2. Congratulations!  

##Requirements

- Xcode 6 or later (Tested on 7)
- iOS 7 or later (Tested on 9)

##Possible features

- More customization
- Pod support 
- OSX compatibility and add here https://github.com/AndrewSB/awesome-osx

##License
CozyLoadingActivity is available under the MIT license. See the [LICENSE file](https://github.com/goktugyil/CozyLoadingActivity/blob/master/LICENSE).

##Keywords
swift, hud, loading, activity, progresshud, progress, track, spinner,
