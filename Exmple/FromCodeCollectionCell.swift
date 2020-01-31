//
//  FromCodeCollectionCell.swift
//  Exmple
//
//  Created by Roman Sorochak on 31.01.2020.
//  Copyright © 2020 MagicLab. All rights reserved.
//

import SnapKit
import Reusable


class FromCodeCollectionCell: UICollectionViewCell, Reusable {
    
    private (set) lazy var imageView: UIImageView = {
        let v = UIImageView()
        
        contentView.addSubview(v)
        v.snp.makeConstraints({ (make) in
            make.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(22)
        })
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        
        return v
    }()
    
    private (set) lazy var label: UILabel = {
        let v = UILabel()
        
        contentView.addSubview(v)
        v.snp.makeConstraints({ (make) in
            make.top.equalTo(self.imageView.snp.bottom).offset(4)
            make.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
        })
        v.textAlignment = .center
        v.backgroundColor = .clear
        
        return v
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.isHidden = false
        imageView.image = UIImage(named: "profile")
        label.isHidden = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
