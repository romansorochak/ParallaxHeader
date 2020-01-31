//
//  BaseTableHeaderFooterView.swift
//  Reusable
//
//  Created by Roman Sorochak on 6/21/17.
//  Copyright © 2017 MagicLab. All rights reserved.
//

import UIKit


open class BaseTableSectionHeaderFooterView: UITableViewHeaderFooterView, Reusable, NibLoadableView {
    
    public var nibView: UIView?
    
    
    open override var contentView: UIView {
        //we use loaded view instead of super.contentView
        guard let view = self.nibView else {
            return super.contentView
        }
        return view
    }
    
    var nibName: String {
        return type(of: self).nibName
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        xibSetup()
    }
    
    override public init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        xibSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        xibSetup()
    }
    
    public func viewDidLoad() { }
}

