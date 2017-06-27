//
//  ItemDetailedHeaderDataSourse.swift
//  ParallaxHeader
//
//  Created by Roman Sorochak on 6/27/17.
//  Copyright © 2017 MagicLab. All rights reserved.
//

import UIKit
import Reusable

typealias ItemDetailedHeaderClickHandler = (_ item: IndexPath, _ image: UIImage, _ cell: ItemDetailedCell)->Void

class ImageHeaderDataSourse: ImagesDataSourse {
    
    private (set) var selectedImageIndex = 0
    private (set) var scrollToItem: IndexPath?
    
    private (set) var clickHandler: ItemDetailedHeaderClickHandler?
    
    var selectedImage: UIImage? {
        if let cell = collectionView?.cellForItem(
            at: IndexPath(item: selectedImageIndex, section: 0)
            ) as? ItemDetailedCell {
            return cell.image
        }
        return nil
    }
    
    
    //MARK: setup
    
    func setup(
        collectionView: UICollectionView,
        images: [UIImage]?,
        handler: ((_ item: IndexPath)->Void)? = nil,
        clickHandler: ItemDetailedHeaderClickHandler? = nil
        ) {
        
        self.clickHandler = clickHandler
        super.setup(collectionView: collectionView, images: images, handler: handler)
    }
    
    override func selectCell(forIndexPath indexPath: IndexPath) {
        scrollToItem = indexPath
        
        collectionView?.scrollToItem(
            at: indexPath,
            at: .right,
            animated: true
        )
    }
    
    override func checkOnRightToLeftMode() {
        if UIApplication.isRTL {
            let indexPath = IndexPath(row: 0, section: 0)
            //            collectionView?.scrollToItem(at: indexPath, at: .right, animated: false)
            //            selectCell(forIndexPath: indexPath)
            collectionView?.scrollToItem(
                at: indexPath,
                at: .right,
                animated: false
            )
        }
    }
    
    
    // MARK: CollectionView protocols
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = collectionView.frame.width
        return CGSize(width: width, height: height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(for: indexPath) as ItemDetailedCell
        
        cell.isSelected = true
        cell.image = images?[indexPath.row]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? ItemDetailedCell else {
            return
        }
        
        clickHandler?(indexPath, cell.image ?? UIImage(), cell)
    }
    
    
    //MARK: scroll view delegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page: Int = {
            let pageLtR = Int(scrollView.contentOffset.x / scrollView.frame.width)
            
            if UIApplication.isRTL,
                let photosCount = images?.count {
                return photosCount - 1 - pageLtR
            }
            return pageLtR
        }()
        
        guard page != selectedImageIndex else { return }
        
        let indexPath = IndexPath(item: page, section: 0)
        
        //check wether need to call handler
        
        if let toItem = scrollToItem,
            indexPath == toItem {
            
            handler?(indexPath)
            selectedImageIndex = page
            scrollToItem = nil
            
            return
        }
        
        if scrollToItem == nil {
            handler?(indexPath)
            selectedImageIndex = page
        }
    }
}

