//
//  FromCodeCollectionVC.swift
//  Exmple
//
//  Created by Roman Sorochak on 31.01.2020.
//  Copyright © 2020 MagicLab. All rights reserved.
//

import SnapKit
import Device


class FromCodeCollectionVC: UIViewController {
    
    var collectionInset: CGFloat {
        return 3
    }
    var interitemSpacing: CGFloat {
        return collectionInset
    }
    var lineSpacing: CGFloat {
        return interitemSpacing * 2
    }
    var inset: CGFloat {
        return interitemSpacing * 2
    }
    var topInset: CGFloat {
        if #available(iOS 11.0, *) {
            return 0
        }
        //roman.sorochak: this is hot fix for ios 10 collection layout issue
        return Constants.Numbers.navBarHeight
    }
    var rowItemsCount: CGFloat {
        return Device.isIPadScreen() ? 4 : 3
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let v = UICollectionView(frame: .zero,
                                 collectionViewLayout: layout)
        
        view.addSubview(v)
        v.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
        v.showsVerticalScrollIndicator = false
        
        v.contentInset = UIEdgeInsets(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0
        )
        v.delaysContentTouches = false
        
        v.delegate = self
        v.dataSource = self
        
        return v
    }()
    
    private weak var headerImageView: UIView?
    
    
    //MARK: - vc life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Collection from code"
        collectionView.isHidden = false
        setupParallaxHeader()
    }
    
    
    //MARK: - parallax
    
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

extension FromCodeCollectionVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(for: indexPath) as FromCodeCollectionCell
        
        cell.label.text = "Item \(indexPath.item)"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - inset * 2 - interitemSpacing * 2 * 2) / rowItemsCount
        let height = width + 22
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return interitemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
    }
}
