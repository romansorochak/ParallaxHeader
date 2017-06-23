# ParallaxHeader
Simple way to add parallax header to UIScrollView or it's subclasses.

![Demo](https://github.com/romansorochak/ParallaxHeader/blob/master/Exmple/Demo.gif)

## Contents
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Requirements

- iOS 9.0+
- Xcode 8.0+
- Swift 3.0+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1.0+ is required to build Reusable 1.0.0+.

To integrate Reusable into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'ParallaxHeader', :git => 'https://github.com/romansorochak/ParallaxHeader.git', :tag => '1.0.0'
end
```

Then, run the following command:

```bash
$ pod install
```

# Usage

To add parallax header to scroll view (table view) you need just create view and set it to your scroll view (table view).

```swift
  //create view as header view    
  let imageView = UIImageView()
  imageView.image = UIImage(named: "1")
  imageView.contentMode = .scaleAspectFill
        
  tableView.parallaxHeader.view = imageView
  tableView.parallaxHeader.height = 400
  tableView.parallaxHeader.minimumHeight = 0
  tableView.parallaxHeader.mode = .topFill
```

## License

Reusable is released under the MIT license. See LICENSE for details.
