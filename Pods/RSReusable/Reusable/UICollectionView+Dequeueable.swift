//
//  UICollectionView+Dequeueable.swift
//  Reusable
//
//  Created by Roman Sorochak on 6/21/17.
//  Copyright © 2017 MagicLab. All rights reserved.
//

import UIKit


extension UICollectionView {
    
    //MARK: headers
    
    func register<T: UICollectionReusableView>(_ : T.Type, viewKind: String) where T: Reusable {
        if let nib = UINib.loadIfExists(nibName: T.nibName, bundle: Bundle.main) {
            register(
                nib,
                forSupplementaryViewOfKind: viewKind,
                withReuseIdentifier: T.reuseIdentifier
            )
        } else {
            register(
                T.self,
                forSupplementaryViewOfKind: viewKind,
                withReuseIdentifier: T.reuseIdentifier
            )
        }
    }
    
    public func dequeueSupplementaryView<T: UICollectionReusableView>(
        for indexPath: IndexPath,
        viewKind: String) -> T where T: Reusable {
        
        register(T.self, viewKind: viewKind)
        
        return dequeueReusableSupplementaryView(
            ofKind: viewKind,
            withReuseIdentifier: T.reuseIdentifier,
            for: indexPath) as! T
    }
    
    
    //MARK: cells
    
    func register<T: UICollectionViewCell>(_: T.Type) where T: Reusable {
        if let nib = UINib.loadIfExists(nibName: T.nibName, bundle: Bundle.main) {
            register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
        } else {
            register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    public func dequeueCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: Reusable {
        
        register(T.self)
        
        return dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
}

