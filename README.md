# Gliphy

Dynamic Type. This is a great technology that makes your app more accessible to people with less than stellar eyesight. And it also makes auto layout a little easier when it comes time to support different languages. It isn't terribly difficult to implement, but can be tedious to cover everything.

Gliphy aims to make it a breeze, and give you a couple of extra benefits along the way. Here's how it works from the most manual up to the most magic way.

## Without Gliphy
First, let's briefly recap how to enable Dynamic Type in your app. In code you can do this with:

```swift
titleLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
```

Or set the appropriate text style in Interface Builder:

IMAGES HERE

Now your label will have the "Headline" style associated with it, and be automatically scaled to the appropriate font size that iOS has stored for "Headline" text. But if the user changes their font settings, the changes will not be reflected until your app quits and is relaunched. To avoid that kind of annoyance, you need to watch for  `UIContentSizeCategoryDidChangeNotification`:

```swift
NSNotificationCenter.defaultCenter().addObserver(self,
            selector: #selector(MyViewController.contentSizeCategoryDidChange(_:)),
            name: UIContentSizeCategoryDidChangeNotification,
            object: nil)
            
func contentSizeCategoryDidChange(_: NSNotification) {
	titleLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
}
```

Imagine having to do that for every single text rendering view in your app. Now you see what I mean by "tedious".

Also, you're still stuck with the system font. Want to go rogue and use something like Avenir? Too bad.

## A little easier
Gliphy was built on the foundation provided by [Big Nerd Ranch's](https://www.bignerdranch.com/) [BNRDynamicTypeManager](https://github.com/bignerdranch/BNRDynamicTypeManager) library. With it you can watch views and let `DynamicTypeManager` handle catching the notification and resetting the text style.

We also extended it to allow you to substitute a custom font if you didn't want to use system.

```swift
import UIKit
import Gliphy

override func viewDidLoad() {
    super.viewDidLoad()
    Gliphy.sharedInstance.watchLabel(titleLabel, textStyle: UIFontTextStyleHeadline, fontName: "Georgia")
}
```

Now, your `titleLabel` will always be Georgia and scale automatically when the font size changes. This is definitely better, but still rather tedious when you start to think that you'll have hundreds of fields in your app that will all need a line of code similar to that one.

## Easy mode
In Gliphy 0.3 the `StyleWatcher` was added. Now you can create a `StyleConfig` object and have it apply to all of the views within a container view. 

First set your text styles in Interface Builder, then define a style:

```swift
// This can go in your AppDelegate or wherever.
func setupStyle() {
    var config = StyleConfig()
    config.label[UIFontTextStyleHeadline] = "Verdana"
    config.label[UIFontTextStyleCaption1] = "MarkerFelt-Thin"
    config.button[UIFontTextStyleHeadline] = "Verdana"
    config.textField[UIFontTextStyleBody] = "Verdana"
    config.textField[UIFontTextStyleCaption1] = "Helvetica"
    StyleWatcher.defaultConfig = config
}
```

And here's how you can watch all of the views in your `ViewController`:

```swift
let watcher = StyleWatcher()

override func viewDidLoad() {
    super.viewDidLoad()
    watcher.watchViews(inView: view)
}
```

`watchViews` will recursively walk through subviews and watch the appropriate fields, so you can just call it once and be done.

If you need a custom config, you can add one to `watchViews`.

```swift
watcher.watchViews(inView: view, withConfig: myCustomConfig)
```

## Custom text styles

iOS 7 provided a few basic text styles:

* `UIFontTextStyleHeadline`
* `UIFontTextStyleSubheadline`
* `UIFontTextStyleBody`
* `UIFontTextStyleFootnote`
* `UIFontTextStyleCaption1`
* `UIFontTextStyleCaption2`

iOS 9 added a few more:

* `UIFontTextStyleTitle1`
* `UIFontTextStyleTitle2`
* `UIFontTextStyleTitle3`
* `UIFontTextStyleCallout`

These are all well and good, but what if you need something else that just doesn't fit in there? Like "UIFontTextStyleReallyReallyReallyBigTitle"? Gliphy let's you watch for your own custom text styles too with the `DynamicFontRegistry` class.

```swift
DynamicFontRegistry.registry.addTextStyle("UIFontTextStyleReallyReallyReallyBigTitle",
                                                  scaledFrom: UIFontTextStyleHeadline,
                                                  byFactor: 4)
        
```

Then use that text style as you would with everything else.

```swift
Gliphy.sharedInstance.watchLabel(heroLabel, textStyle: "UIFontTextStyleReallyReallyReallyBigTitle", fontName: "MarkerFelt-Thin")

// or

StyleWatcher.defaultConfig.label["UIFontTextStyleReallyReallyReallyBigTitle"] = "MarkerFelt-Thin"
```

# Installation with Cocoapods
Add this line to your podfile:

    pod "Gliphy", "~> 0.3.0"

# Installation without Cocoapods
Take all of the files in the `Gliphy/Core` folder and copy them into your project. That's it.

# License
MIT license. See `LICENSE` for more details.
