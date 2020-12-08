//
//  AppManager.swift
//  mallers
//
//  Created by Mahmoud Nasser on 5/10/20.
//  Copyright © 2020 Mahmoud Nasser. All rights reserved.
//

import Foundation
import UIKit


class AppManager: NSObject {
    static let shared = AppManager()
    
    var window: UIWindow?
    
    static func launchApp(_ application: UIApplication) {
        if #available(iOS 13, *) {
        } else {
            initWindow()
        }
    }
    
    static func initWindow() {
        let window = UIWindow(frame: UIScreen.main.bounds)

        self.shared.window = window
        let vc = Container.MainTaps.createHomeViewController()
        AppManager.setRoot(viewController: vc)
    }
    
    @available(iOS 13.0, *)
    static func initSceneWindow(_ windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)


        self.shared.window = window
        let vc = Container.MainTaps.createHomeViewController()
        AppManager.setRoot(viewController: vc)

    }
    
    static func setRoot(viewController: UIViewController) {
        if let appWindow = AppManager.shared.window {
            appWindow.rootViewController = viewController
            appWindow.makeKeyAndVisible()
        }
    }
}
