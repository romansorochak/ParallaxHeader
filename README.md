# ParallaxHeader
Simple way to add parallax header to UIScrollView or it's subclasses.

|        One image view      |     Slider with images          |     Blur vibrant text        |  Blur round icon   |
|----------------------------|---------------------------------|------------------------------|--------------------|
|![Demo](https://github.com/romansorochak/ParallaxHeader/blob/master/Exmple/Demo.gif)|![Demo](https://github.com/romansorochak/ParallaxHeader/blob/master/Exmple/CollectionDemo.gif)|![Demo](https://github.com/romansorochak/ParallaxHeader/blob/master/Exmple/Demo_with_blur.gif)|![Demo](https://github.com/romansorochak/ParallaxHeader/blob/master/Exmple/Demo_blur_icon.gif)|

## Try it [here](https://appetize.io/app/8v7k0gb5juwc1aeh4up179v8cw?device=iphone5s&scale=75&orientation=portrait&osVersion=9.3)

## Contents
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Requirements

- iOS 8.0+
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
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'ParallaxHeader'
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

## Use case - Blur vibrant text
- [Blur](https://github.com/romansorochak/Blur) library is used here.
- [SnapKit](https://github.com/SnapKit/SnapKit) library is used here.
```swift
let imageView = UIImageView()
imageView.image = UIImage(named: "profile")
imageView.contentMode = .scaleAspectFill
        
//setup blur vibrant view
imageView.blurView.setup(style: UIBlurEffectStyle.dark, alpha: 1).enable()
        
headerImageView = imageView
        
tableView.parallaxHeader.view = imageView
tableView.parallaxHeader.height = 400
tableView.parallaxHeader.minimumHeight = 40
tableView.parallaxHeader.mode = .centerFill
tableView.parallaxHeader.parallaxHeaderDidScrollHandler = { parallaxHeader in
    //update alpha of blur view on top of image view 
    parallaxHeader.view.blurView.alpha = 1 - parallaxHeader.progress
}
        
// Label for vibrant text
let vibrantLabel = UILabel()
vibrantLabel.text = "Vibrant"
vibrantLabel.font = UIFont.systemFont(ofSize: 40.0)
vibrantLabel.sizeToFit()
vibrantLabel.textAlignment = .center
imageView.blurView.vibrancyContentView?.addSubview(vibrantLabel)
//add constraints using SnapKit library
vibrantLabel.snp.makeConstraints { make in
    make.edges.equalToSuperview()
}
```

## Use case - Blur round icon
- [Blur](https://github.com/romansorochak/Blur) library is used here.
- [SnapKit](https://github.com/SnapKit/SnapKit) library is used here.
```swift
let image = UIImage(named: "profile")
        
let imageView = UIImageView()
imageView.image = image
imageView.contentMode = .scaleAspectFill
parallaxHeaderView = imageView
        
//setup bur view
imageView.blurView.setup(style: UIBlurEffectStyle.dark, alpha: 1).enable()
        
tableView.parallaxHeader.view = imageView
tableView.parallaxHeader.height = 400
tableView.parallaxHeader.minimumHeight = 120
tableView.parallaxHeader.mode = .centerFill
tableView.parallaxHeader.parallaxHeaderDidScrollHandler = { parallaxHeader in
    //update alpha of blur view on top of image view
    parallaxHeader.view.blurView.alpha = 1 - parallaxHeader.progress
}
        
let roundIcon = UIImageView(
    frame: CGRect(x: 0, y: 0, width: 100, height: 100)
)
roundIcon.image = image
roundIcon.layer.borderColor = UIColor.white.cgColor
roundIcon.layer.borderWidth = 2
roundIcon.layer.cornerRadius = roundIcon.frame.width / 2
roundIcon.clipsToBounds = true
        
//add round image view to blur content view
//do not use vibrancyContentView to prevent vibrant effect
imageView.blurView.blurContentView?.addSubview(roundIcon)
//add constraints using SnpaKit library
roundIcon.snp.makeConstraints { make in
    make.center.equalToSuperview()
    make.width.height.equalTo(100)
}
```

## Author
Roman Sorochak - iOS developer - roman.sorochak@gmail.com

## License

ParallaxHeader is released under the MIT license. See [LICENSE](https://github.com/romansorochak/ParallaxHeader/blob/master/LICENSE) for details.
