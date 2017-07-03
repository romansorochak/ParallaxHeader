//
//  RoundIconParallaxVC.swift
//  ParallaxHeader
//
//  Created by Roman Sorochak on 7/3/17.
//  Copyright © 2017 MagicLab. All rights reserved.
//

import UIKit


class BlurRoundIconParallaxVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    weak var parallaxHeaderView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupParallaxHeader()
    }
    
    
    //MARK: private
    
    private func setupParallaxHeader() {
        let image = UIImage(named: "profile")
        
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        parallaxHeaderView = imageView
        
        //setup bur view
        imageView.blurView.setup(style: UIBlurEffectStyle.dark, alpha: 1).enable()
        
        tableView.parallaxHeader.view = imageView
        tableView.parallaxHeader.height = 400
        tableView.parallaxHeader.minimumHeight = 120
        tableView.parallaxHeader.mode = .centerFill
        tableView.parallaxHeader.parallaxHeaderDidScrollHandler = { parallaxHeader in
            //update alpha of blur view on top of image view
            parallaxHeader.view.blurView.alpha = 1 - parallaxHeader.progress
        }
        
        let roundIcon = UIImageView(
            frame: CGRect(x: 0, y: 0, width: 100, height: 100)
        )
        roundIcon.image = image
        roundIcon.layer.borderColor = UIColor.white.cgColor
        roundIcon.layer.borderWidth = 2
        roundIcon.layer.cornerRadius = roundIcon.frame.width / 2
        roundIcon.clipsToBounds = true
        
        //add round image view to blur content view
        //do not use vibrancyContentView to prevent vibrant effect
        imageView.blurView.blurContentView?.addSubview(roundIcon)
        //add constraints using SnpaKit library
        roundIcon.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(100)
        }
    }
    
    
    //MARK: table view data source/delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = "some row text"
        
        return cell
    }
}


