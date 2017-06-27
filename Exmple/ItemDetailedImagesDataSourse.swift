//
//  ItemDetailedImagesDataSourse.swift
//  ParallaxHeader
//
//  Created by Roman Sorochak on 6/27/17.
//  Copyright © 2017 MagicLab. All rights reserved.
//

import UIKit
import Reusable

class ImagesDataSourse: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private (set) weak var collectionView: UICollectionView? {
        didSet {
            collectionView?.dataSource = self
            collectionView?.delegate = self
        }
    }
    
    private (set) var handler: ((_ item: IndexPath)->Void)?
    private (set) var images: [UIImage]?
    private (set) var selectedPicture: Int = 0
    
    func setup(
        collectionView: UICollectionView,
        images: [UIImage]?,
        handler: ((_ item: IndexPath)->Void)? = nil
        ) {
        
        self.handler = handler
        self.images = images
        self.collectionView = collectionView
    }
    
    func selectCell(forIndexPath indexPath: IndexPath) {
        collectionView?.scrollToItem(
            at: indexPath,
            at: .centeredHorizontally,
            animated: true
        )
        
        //deselect
        let prevIndexPath = IndexPath(item: selectedPicture, section: 0)
        if let prevCell = collectionView?.cellForItem(at: prevIndexPath) {
            prevCell.isSelected = false
        }
        
        //select
        if let cell = collectionView?.cellForItem(at: indexPath) as? ItemDetailedCell {
            cell.isSelected = true
        }
        
        selectedPicture = indexPath.row
    }
    
    func invalidateLayout() {
        collectionView?.collectionViewLayout.invalidateLayout()
    }
    
    func checkOnRightToLeftMode() {
        if UIApplication.isRTL {
            let indexPath =  IndexPath(row: 0, section: 0)
            collectionView?.scrollToItem(at: indexPath, at: .right, animated: false)
        }
    }
    
    
    // MARK: CollectionView protocols
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(for: indexPath) as ItemDetailedCell
        
        cell.isSelected = indexPath.item == selectedPicture
        
        cell.image = images?[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        selectCell(forIndexPath: indexPath)
        handler?(indexPath)
    }
}

