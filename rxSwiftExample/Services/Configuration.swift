//
//  Configuration.swift
//  mallers
//
//  Created by Mahmoud Nasser on 5/9/20.
//  Copyright © 2020 Mahmoud Nasser. All rights reserved.
//

import Foundation
import UIKit

enum Environment: String {
    case Stage = "Stage"
    case Live = "Live"
    case OnlineShoppingStage = "Online Shopping Stage"
    case OnlineShoppingLive = "Online Shopping Live"
    
    var baseURL: String {
        switch self {
        case .Stage: return "https://asalanew-stage.ibtikar.sa"
        case .Live: return "https://prelive-api.mallers.com.sa"
        case .OnlineShoppingStage: return "https://asalanew-stage.ibtikar.sa"
        case .OnlineShoppingLive: return "https://prelive-api.mallers.com.sa"
        }
    }
    
    var hostURL: String {
        switch self {
        case .Stage: return "asalanew-stage.ibtikar.sa"
        case .Live: return "prelive-api.mallers.com.sa"
        case .OnlineShoppingStage: return "asalanew-stage.ibtikar.sa"
        case .OnlineShoppingLive: return "prelive-api.mallers.com.sa"
        }
    }
}

struct Configuration {
    lazy var environment: Environment = {
        if let configuration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String {
            
            switch configuration {
            case Environment.Stage.rawValue:
                return Environment.Stage
            case Environment.Live.rawValue:
                return Environment.Live
            case Environment.OnlineShoppingLive.rawValue:
                return Environment.OnlineShoppingLive
            case Environment.OnlineShoppingStage.rawValue:
                return Environment.OnlineShoppingStage
            default:
                return Environment.Stage
            }
        }
        return Environment.Stage
    }()
}
