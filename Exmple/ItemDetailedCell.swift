//
//  ItemDetailedCellCell.swift
//  Alababic
//
//  Created by Bohdan Paliychuk on 11/10/16.
//  Copyright © 2016 Roman Sorochak. All rights reserved.
//

import UIKit
import Reusable

class ItemDetailedCell: UICollectionViewCell, Reusable {
    
    @IBOutlet weak fileprivate var imageView: UIImageView!
    @IBOutlet weak fileprivate var whiteEffectView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        isSelected = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        isSelected = true
    }
    
    
    var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
        }
    }
    
    override var isSelected: Bool {
        didSet {
            whiteEffectView.isHidden = isSelected
        }
    }
}
