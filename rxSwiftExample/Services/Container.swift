//
//  Container.swift
//  mallers
//
//  Created by Mahmoud Nasser on 5/9/20.
//  Copyright © 2020 Mahmoud Nasser. All rights reserved.
//

import Foundation
import UIKit

class Container {
    class AppBase {
        class func baseNavigationController() -> UINavigationController {
            
            let navigation = UINavigationController()
            navigation.edgesForExtendedLayout = []
            navigation.extendedLayoutIncludesOpaqueBars = false
            navigation.setNavigationBarHidden(false, animated: false)
            navigation.view.backgroundColor = .clear
            navigation.navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigation.navigationBar.shadowImage = UIImage()
            navigation.navigationBar.backgroundColor = .clear
            navigation.navigationBar.tintColor = .white
            return navigation
        }
    }
    
    class MainTaps {
        class func createHomeViewController() -> UIViewController {
            let homeVC = HomeViewController()
            
            let navigation = Container.AppBase.baseNavigationController()
            navigation.setViewControllers([homeVC], animated: true)
            return navigation
        }
    }
    
    class Controllers {
        //        class func createLoginViewController() -> UIViewController {
        //            let loginVC = LoginViewController()
        //            let navigation = Container.AppBase.baseNavigationController()
        //            navigation.setViewControllers([loginVC], animated: true)
        //            return navigation
        //        }
        
        
    }
}
