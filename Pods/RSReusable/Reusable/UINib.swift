//
//  UINib.swift
//  Reusable
//
//  Created by Roman Sorochak on 6/21/17.
//  Copyright © 2017 MagicLab. All rights reserved.
//

import UIKit


extension UINib {
    
    class func loadIfExists(nibName name: String, bundle: Bundle) -> UINib? {
        if bundle.path(forResource: name, ofType: "nib") == nil {
            return nil
        } else {
            return UINib(nibName: name, bundle: bundle)
        }
    }
}
