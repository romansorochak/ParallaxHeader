//
//  Constants.swift
//  Exmple
//
//  Created by Roman Sorochak on 31.01.2020.
//  Copyright © 2020 MagicLab. All rights reserved.
//

import UIKit
import Device


struct Constants {
    struct Numbers {
        static var topSafeAreaHeight: CGFloat {
            if Device.isIPhoneXSimilar() {
                return 20
            }
            return 0
        }
        static var statusBarHeight: CGFloat {
            return 20 + topSafeAreaHeight
        }
        static let navBarContentHeight: CGFloat = 40
        static var navBarHeight: CGFloat {
            return statusBarHeight + navBarContentHeight
        }
        static var bottomSafeAreaHeight: CGFloat {
            if Device.isIPhoneXSimilar() {
                return 34
            }
            return 0
        }
        static let tabBarContentHeight: CGFloat = 49
        static var tabBarHeight: CGFloat {
            return bottomSafeAreaHeight + tabBarContentHeight
        }
    }
}


