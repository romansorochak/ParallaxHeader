//
//  CollectionView.swift
//  ParallaxHeader
//
//  Created by Roman Sorochak on 7/11/17.
//  Copyright © 2017 MagicLab. All rights reserved.
//

import UIKit


class CollectionView: UICollectionView {
 
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        print("CollectionView: touchesMoved")
    }
}
