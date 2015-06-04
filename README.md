# CozyLoadingActivity
Custom Swift loading activity for iOS7-8. Really simple to use, just add the class and write 1 line of code to add and one line to remove it and thats it. Also no need for images.

## How to use:
```swift
var loadingActivity = CozyLoadingActivity(text: "Loading...", sender: self, disableUI: true)
```
Sender is a UIViewController and disableUI stops user interactions until you hide loadingactivity.
Use this line to initialize CozyLoadingActivity and this view pops up in the middle of the screen:
![CozyLoadingActivity Loading...](http://i.imgur.com/O6EZIr7.png)
```swift
loadingActivity.hideLoadingActivity(success: true, animated: true)
```
If animated is set to true, the view animates from the old view in to the new one like this:

![CozyLoadingActivity Animation](http://i.imgur.com/eOVrMtx.png)

Here is the success view, stay on screen for half a second:

![CozyLoadingActivity Success](http://i.imgur.com/mDg7DmG.png)

You can also do failure view:
```swift
loadingActivity.hideLoadingActivity(success: false, animated: true)
```
![CozyLoadingActivity Failure](http://i.imgur.com/OQ1cwvn.png)

## Example Use Case:

```swift
var loadingActivity = CozyLoadingActivity(text: "Uploading...", sender: mainPointer, disableUI: true)

var userObject = PFUser.currentUser()
postObject.saveInBackgroundWithBlock { (succeeded: Bool, error: NSError!) -> Void in
    if error == nil {
       if succeeded == true {
          loadingActivity.hideLoadingActivity(success: true, animated: true)
          println("Upload Complete")
        } else {
          loadingActivity.hideLoadingActivity(success: false, animated: true)
          println("Upload Failed")
       }
    } else {
       loadingActivity.hideLoadingActivity(success: false, animated: true)
        println("Error")
    }
}
```

## License:

          DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE 
    TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION 

     0. You just DO WHAT THE FUCK YOU WANT TO.

http://www.wtfpl.net/about/
