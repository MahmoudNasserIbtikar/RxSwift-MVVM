//
//  SubjectsResponseModel.swift
//  mallers
//
//  Created by Mahmoud Nasser on 6/17/20.
//  Copyright © 2020 Mahmoud Nasser. All rights reserved.
//

import Foundation
import ObjectMapper

class SubjectsResponseModel: BaseResponse {
    
    var data: [SubjectModel]?

    override func mapping(map: Map) {
        super.mapping(map: map)
        data <- map["data"]
    }
}
