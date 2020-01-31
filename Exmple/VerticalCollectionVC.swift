//
//  VerticalCollectionVC.swift
//  Exmple
//
//  Created by Roman Sorochak on 31.01.2020.
//  Copyright © 2020 MagicLab. All rights reserved.
//

import UIKit
import ParallaxHeader


class VerticalCollectionVC: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    weak var headerImageView: UIView?
    
    
    //MARK: - vc life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupParallaxHeader()
    }
    
    
    //MARK: - private
    
    private func setupParallaxHeader() {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        imageView.contentMode = .scaleAspectFill
        
        //setup blur vibrant view
        imageView.blurView.setup(style: UIBlurEffect.Style.dark, alpha: 1).enable()
        imageView.blurView.alpha = 0
        
        headerImageView = imageView
        
        collectionView.parallaxHeader.view = imageView
        collectionView.parallaxHeader.height = 400
        collectionView.parallaxHeader.minimumHeight = 40
        collectionView.parallaxHeader.mode = .centerFill
        collectionView.parallaxHeader.parallaxHeaderDidScrollHandler = { parallaxHeader in
            //update alpha of blur view on top of image view
            parallaxHeader.view.blurView.alpha = 1 - parallaxHeader.progress
        }
        
        // Label for vibrant text
        let vibrantLabel = UILabel()
        vibrantLabel.text = "Vibrant"
        vibrantLabel.font = UIFont.systemFont(ofSize: 40.0)
        vibrantLabel.sizeToFit()
        vibrantLabel.textAlignment = .center
        imageView.blurView.vibrancyContentView?.addSubview(vibrantLabel)
        //add constraints using SnapKit library
        vibrantLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}


extension VerticalCollectionVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        
        cell.label.text = "Item \(indexPath.item)"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 3 * 2 - 6 * 2 * 2) / 3
        let height = width + 22
        
        return CGSize(width: width, height: height)
    }
}
