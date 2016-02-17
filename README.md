# Gliphy
Gliphy is a Swift library to help you manage custom fonts in Dynamic Type. It listens for `UIContentSizeCategoryDidChangeNotification` and updates all of the views it is watching.

You can see it in action by cloning this repository and running the Example app.

A big thank you to Big Nerd Ranch for [BNRDynamicTypeManager](https://github.com/bignerdranch/BNRDynamicTypeManager) which served as a template for this project.

# Usage
Create and layout your views in code or Interface Builder. Tell `DynamicTypeManager` to watch those views and apply the appropriate styling and font names to them.

```swift
import UIKit
import Gliphy

class ViewController: UIViewController {
  @IBOutlet weak var titleLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    DynamicTypeManager.sharedInstance.watchLabel(titleLabel,
      textStyle: UIFontTextStyleHeadline,
      fontName: "Georgia")
  }
}
```

# Installation with Cocoapods
Add this line to your podfile:

    pod "Gliphy", "~> 0.1.0"

# Installation without Cocoapods
Take all of the files in the `Gliphy/Core` folder and copy them into your project. That's it.

# License
MIT license. See `LICENSE` for more details.
