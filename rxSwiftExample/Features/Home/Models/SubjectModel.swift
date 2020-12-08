//
//  SubjectModel.swift
//  mallers
//
//  Created by Mahmoud Nasser on 6/17/20.
//  Copyright © 2020 Mahmoud Nasser. All rights reserved.
//

import Foundation
import ObjectMapper

class SubjectModel: Mappable {
    
    var id: String?
    var title: String?
    var type: Int?

    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        type <- map["type"]
    }
    
    required init?(map: Map) {

    }
}
