//
//  BaseResponse.swift
//  mallers
//
//  Created by Mahmoud Nasser on 5/10/20.
//  Copyright © 2020 Mahmoud Nasser. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseResponse: Mappable {
    
    var message: String?
    var errors: [String: [String]]?
    var statusCode: Int?
    var meta: MetaModel?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        message <- map["message"]
        errors <- map["errors"]
        statusCode <- map["statusCode"]
        meta <- map["meta"]

    }    
}
