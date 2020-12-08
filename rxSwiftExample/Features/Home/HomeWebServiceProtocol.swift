//
//  HomeWebServiceProtocol.swift
//  rxSwift
//
//  Created by Mahmoud Nasser on 12/8/20.
//

import Foundation
import ObjectMapper

protocol HomeWebServiceProtocol: class {
    
    func getSubjects(
        page: Int,
        perPage: Int,
        compeltion: @escaping ((Result<SubjectsResponseModel, NetworkError>) -> Void))
}

class HomeWebService: HomeWebServiceProtocol {
    static let shared = HomeWebService()
    
    func getSubjects(
        page: Int,
        perPage: Int,
        compeltion: @escaping ((Result<SubjectsResponseModel, NetworkError>) -> Void)) {
        
        
        MainWebService.fetch(endPoint: RouteSubjectsApi.getSubjects(
                                page: page,
                                perPage: perPage)) { (result, statusCode) in
            switch result {
            case .success(let response):
                guard let subjectsResponse = Mapper<SubjectsResponseModel>().map(JSONObject: response) else {
                    return
                }
                subjectsResponse.statusCode = statusCode
                compeltion(Result.success(subjectsResponse))
            case .failure(var error):
                error.statusCode = statusCode
                compeltion(Result.failure(error))
            }
        }
    }
}
