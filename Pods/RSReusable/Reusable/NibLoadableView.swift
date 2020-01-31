//
//  NibLoadableView.swift
//  Reusable
//
//  Created by Roman Sorochak on 6/21/17.
//  Copyright © 2017 MagicLab. All rights reserved.
//

import UIKit


public protocol NibLoadableView: NibNameProtocol {
    
    var nibView: UIView? { get set }
    
    func viewDidLoad()
}


extension NibLoadableView where Self: UIView {
    
    func xibSetup() {
        if let view = loadViewFromNib() {
            // use bounds not frame or it'll be offset
            view.frame = bounds
            
            // Make the view stretch with containing view
            view.autoresizingMask = [
                UIView.AutoresizingMask.flexibleWidth,
                UIView.AutoresizingMask.flexibleHeight
            ]
            
            addSubview(view)
            
            self.nibView = view
        }
        
        viewDidLoad()
    }
    
    private func loadViewFromNib() -> UIView? {
        let type = Swift.type(of: self)
        let bundle = Bundle(for: type)
        let nib = UINib.loadIfExists(nibName: type.nibName,
                                     bundle: bundle)
        
        let view = nib?.instantiate(withOwner: self, options: nil)[0] as? UIView
        
        return view
    }
}


@IBDesignable
open class BaseNibView: UIView, NibLoadableView {
    
    public var nibView: UIView?

    open override func awakeFromNib() {
        super.awakeFromNib()
        
        xibSetup()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        xibSetup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        xibSetup()
    }
    
    
    open func viewDidLoad() { }
}


