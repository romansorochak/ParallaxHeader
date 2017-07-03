# ParallaxHeader
Simple way to add parallax header to UIScrollView or it's subclasses.

|        One image view      |     Slider with images          |     Blur vibrant text        |  Blur round icon   |
|----------------------------|---------------------------------|------------------------------|--------------------|
|![Demo](https://github.com/romansorochak/ParallaxHeader/blob/master/Exmple/Demo.gif)|![Demo](https://github.com/romansorochak/ParallaxHeader/blob/master/Exmple/CollectionDemo.gif)|![Demo](https://github.com/romansorochak/ParallaxHeader/blob/master/Exmple/Demo_with_blur.gif)|![Demo](https://github.com/romansorochak/ParallaxHeader/blob/master/Exmple/Demo_blur_icon.gif)|

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

## Use case - one image view
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

## Use case - slider of images
```swift
let parallaxHeight: CGFloat = view.frame.height - 64 - 49 - sliderHeight
let layout = UICollectionViewFlowLayout()
layout.scrollDirection = .horizontal
collectionParallaxView = UICollectionView(
    frame: CGRect(x: 0, y: 0, width: view.frame.width, height: parallaxHeight),
    collectionViewLayout: layout
)
collectionParallaxView.isPagingEnabled = true
collectionParallaxView.showsHorizontalScrollIndicator = false
collectionParallaxView.backgroundColor = UIColor.white
collectionParallaxView.delegate = self
collectionParallaxView.dataSource = self

//adding view as parallax header to table view is straightforward
tableView.parallaxHeader.view = collectionParallaxView
tableView.parallaxHeader.height = parallaxHeight
tableView.parallaxHeader.minimumHeight = 0
tableView.parallaxHeader.mode = .centerFill
tableView.parallaxHeader.parallaxHeaderDidScrollHandler = { parallaxHeader in
    print(parallaxHeader.progress)
}
```

## License

Reusable is released under the MIT license. See [LICENSE](https://github.com/romansorochak/ParallaxHeader/blob/master/LICENSE) for details.
