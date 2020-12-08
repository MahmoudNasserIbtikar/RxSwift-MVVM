//
//  BaseViewController.swift
//  mallers
//
//  Created by Mahmoud Nasser on 5/10/20.
//  Copyright © 2020 Mahmoud Nasser. All rights reserved.
//

import UIKit
import SwiftMessages
import NVActivityIndicatorView
import ObjectMapper
import Windless

class BaseViewController: UIViewController {
    
    private(set) var prefersBottomBarHidden: Bool?
    
    final override var hidesBottomBarWhenPushed: Bool {
        get {
            if navigationController?.viewControllers.last == self {
                return prefersBottomBarHidden ?? super.hidesBottomBarWhenPushed
            } else {
                return false
            }
        }
        set {
            super.hidesBottomBarWhenPushed = newValue
        }
    }
    
    var address: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func addFeedbackGenerator() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.prepare()
        impactFeedback.impactOccurred()
    }
    
    func showError(message: String) {
        let error = MessageView.viewFromNib(layout: .tabView)
        //        success.configureTheme(.success)
        let iconImage = (IconStyle.default).image(theme: .error)
        error.configureTheme(backgroundColor: .errorBackGround, foregroundColor: .black, iconImage: iconImage)
        error.iconImageView?.tentImageColor(color: .red)
        error.configureDropShadow()
        error.configureContent(title: L10n.Message.Error.title, body: message)
        error.button?.isHidden = true
        error.titleLabel?.isHidden = true
        error.titleLabel?.lineHeight = 0
        error.iconLabel?.lineHeight = 0
        
        if message.count <= 40 {
            error.layoutMarginAdditions = UIEdgeInsets(top: -8, left: 0, bottom: 10, right: 0)
            error.backgroundHeight = 92
            
        } else {
            error.layoutMarginAdditions = UIEdgeInsets(top: -8, left: 0, bottom: 20, right: 0)
            error.backgroundHeight = 105
        }
        
        var errorConfig = SwiftMessages.defaultConfig
        errorConfig.presentationStyle = .top
        errorConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        SwiftMessages.show(config: errorConfig, view: error)
    }
    
    func showSuccessMessage(message: String) {
        let success = MessageView.viewFromNib(layout: .tabView)
        //        success.configureTheme(.success)
        
        let iconImage = (IconStyle.default).image(theme: .success)
        success.configureTheme(backgroundColor: .sucessBackground, foregroundColor: .black, iconImage: iconImage)
        success.iconImageView?.tentImageColor(color: .sucess)
        success.configureDropShadow()
        success.configureContent(title: L10n.Message.Success.title, body: message)
        success.button?.isHidden = true
        success.titleLabel?.isHidden = true
        success.titleLabel?.lineHeight = 0
        success.iconLabel?.lineHeight = 0
        
        if message.count <= 40 {
            success.layoutMarginAdditions = UIEdgeInsets(top: -8, left: 0, bottom: 10, right: 0)
            success.backgroundHeight = 92
            
        } else {
            success.layoutMarginAdditions = UIEdgeInsets(top: -8, left: 0, bottom: 20, right: 0)
            success.backgroundHeight = 105
        }
        
        var successConfig = SwiftMessages.defaultConfig
        successConfig.presentationStyle = .top
        successConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        SwiftMessages.show(config: successConfig, view: success)
    }
    
    func addBlueEffect() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        view.addSubview(blurEffectView)
    }
}

extension BaseViewController: NVActivityIndicatorViewable {
    func showLoading() {
        startAnimating(type: NVActivityIndicatorType.cubeTransition)
    }
    
    func hideLoading() {
        stopAnimating()
    }
}
