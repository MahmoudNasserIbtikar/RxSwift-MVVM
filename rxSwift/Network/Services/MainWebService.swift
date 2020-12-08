//
//  MainWebService.swift
//  mallers
//
//  Created by Mahmoud Nasser on 5/10/20.
//  Copyright © 2020 Mahmoud Nasser. All rights reserved.
//

import Foundation
import Moya

final class MainWebService {
    static func fetch(endPoint: TargetType, _ compltion: @escaping (Result<Any, NetworkError>) -> Void) {
        MoyaProvider<MultiTarget>(plugins: [NetworkLoggerPlugin()]).request(MultiTarget(endPoint)) { (response) in
            switch response {
            case .success(let response):
                do {
                    let jsonResponse = try response.mapJSON()
                    compltion(Result.success(jsonResponse))
                } catch {
                    print(error.localizedDescription)
                }
                
            case .failure(let error):
                compltion(.failure(NetworkError(error: error)))
            }
        }
    }
    
    static func fetch2(endPoint: TargetType, _ compltion: @escaping (Result<Any, NetworkError>, Int) -> Void) {
        MoyaProvider<MultiTarget>(plugins: [NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))]).request(MultiTarget(endPoint)) { (response) in
            switch response {
            case .success(let response):
                do {
                    let jsonResponse = try response.mapJSON()
                    compltion(Result.success(jsonResponse), response.statusCode)
                } catch {
                    print(error.localizedDescription)
                }
                
            case .failure(let error):
                compltion(.failure(NetworkError(error: error)), error.errorCode)
            }
        }
    }
    
    static func fetchCancellable<E: TargetType>(endPoint: E, _ compltion: @escaping (Result<Any, NetworkError>, Int) -> Void) -> Cancellable {
        let cancellableProvider = MoyaProvider<MultiTarget>(
            plugins: [NetworkLoggerPlugin()])
            .request(MultiTarget(endPoint)) { (response) in
                switch response {
                case .success(let response):
                    do {
                        let jsonResponse = try response.mapJSON()
                        compltion(Result.success(jsonResponse), response.statusCode)
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                case .failure(let error):
                    compltion(.failure(NetworkError(error: error)), error.errorCode)
                }
            }
        return cancellableProvider
    }
}
