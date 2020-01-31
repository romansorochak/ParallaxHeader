# Reusable
Easy way to setup custom cells with xib

## Contents
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Author](#author)
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
    pod 'RSReusable'
end
```

Then, run the following command:

```bash
$ pod install
```

## Usage

Make sure you name your cell's class and xib with the same names 

- MyCell.swift:
```swift
class MyCell: UITableViewCell, Reusable {
```

- MyCell.xib

### UITableViewCell
#### Custom table cell with xib
1) Make cell to implement Reusable protocol
```swift
import Reusable
//...
class MyCell: UITableViewCell, Reusable {
```
2) (optional) Make cusom xib cell and set cell's class to MyCell
3) Dequeue cell
```swift
import Reusable
//...
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeue(forIndexPath: indexPath) as MyCell
    
    //setup cell ...
    
    return cell    
}
```
#### Custom table header (footer) with xib
1) Make header (footer) to inherit from BaseTableSectionHeaderFooterView class
```swift
import Reusable
//...
class MySectionHeaderView: BaseTableSectionHeaderFooterView {
```
2) (optional) Make cusom xib view and set file's owner to your class name - MySectionHeaderView
3) Dequeue header (footer) view 
```swift
import Reusable
//...
func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let header = tableView.dequeueHeaderFooterView() as MySectionHeaderView

    //setup header ...
    
    return header
}
```

### UICollectionViewCell
#### Custom collection cell with xib
1) Make cell to implement Reusable protocol
```swift
import Reusable
//...
class MyCollectionCell: UICollectionViewCell, Reusable {
```
2) (optional) Make cusom xib cell and set cell's class to MyCollectionCell
3) Dequeue cell
```swift
import Reusable
//...
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueCell(for: indexPath) as MyCollectionCell
    
    //setup cell ...
    
    return cell    
}
```
#### Custom collection header with xib
1) Make header (footer) to implement Reusable protocol
```swift
import Reusable
//...
class CollectionHeaderView: UICollectionReusableView, Reusable {
```
2) (optional) Make cusom xib view (UICollectionReusableView) and set it's class to CollectionHeaderView
3) Dequeue view 
```swift
import Reusable
//...
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueCell(for: indexPath) as CollectionHeaderView

    //setup header ...
    
    return header
}
```

## Author
Roman Sorochak - iOS developer. You may contact me via email: roman.sorochak@gmail.com

## License

Reusable is released under the MIT license. See [LICENSE](https://github.com/romansorochak/Reusable/blob/master/LICENSE) for details.
