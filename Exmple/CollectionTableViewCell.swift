//
//  CollectionTableViewCell.swift
//  Alababic
//
//  Created by Dima Paliychuk on 6/12/17.
//  Copyright © 2017 Roman Sorochak. All rights reserved.
//

import UIKit
import Reusable


class CollectionTableViewCell: UITableViewCell, Reusable {
    
    @IBOutlet weak var collectionView: UICollectionView!

    
    // life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
