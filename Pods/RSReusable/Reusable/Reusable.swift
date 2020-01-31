//
//  Reusable.swift
//  Reusable
//
//  Created by Roman Sorochak on 6/21/17.
//  Copyright © 2017 MagicLab. All rights reserved.
//

import UIKit


public protocol ReusableView: class {}

public extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}


public protocol NibNameProtocol: class { }

public extension NibNameProtocol where Self: UIView {
    
    static var nibName: String {
        return String(describing: self)
    }
}


public protocol Reusable: ReusableView, NibNameProtocol { }
