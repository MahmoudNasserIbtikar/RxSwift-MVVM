//
//  RouteSubjectsApi.swift
//  mallers
//
//  Created by Mahmoud Nasser on 6/17/20.
//  Copyright © 2020 Mahmoud Nasser. All rights reserved.
//

import Foundation
import Moya

enum RouteSubjectsApi {
    case getSubjects(page: Int, perPage: Int)
}

extension RouteSubjectsApi: TargetType {
    
    var baseURL: URL {
        
//        switch self {
//        case .getSubjects(page: let page, perPage: let perPage):
//
//            var urlComponents = URLComponents()
//            urlComponents.scheme = "https"
//            urlComponents.host = "https://smea-pc.ibtikar.sa"
//            urlComponents.path = ApiUrls.Apis.subjects
////            urlComponents.queryItems = [
////                URLQueryItem(name: "page", value: String(page)),
////                URLQueryItem(name: "per_page", value: String(perPage))
////            ]
//            return urlComponents.url!
//        }
        
        return URL(string: "https://smea-pc.ibtikar.sa")!
    }
    
    var path: String {
        return ApiUrls.Apis.subjects
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getSubjects:
            return .requestParameters(
                parameters: ["_format": "json"],
                encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        var headers = ["x-api-key": Constant.Keys.apiKey]
        headers["Accept"] = Constant.Keys.contentType
        headers["Content-Type"] = Constant.Keys.contentType
        headers["Accept-Language"] = LocalizationManager.currentLanguage().languageCode
        return headers
    }
    
}
