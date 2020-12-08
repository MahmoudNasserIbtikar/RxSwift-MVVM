//
//  MetaModel.swift
//  mallers
//
//  Created by Mahmoud Nasser on 6/8/20.
//  Copyright © 2020 Mahmoud Nasser. All rights reserved.
//

import Foundation
import ObjectMapper

class MetaModel: Mappable {
    
    var currentPage: Int?
    var from: Int?
    var lastPage: Int?
    var perPage: Int?
    var perPageString: String? {
        didSet {
           perPage = Int(perPageString ?? "") ?? 0
        }
    }
    var total: Int?

    func mapping(map: Map) {
        currentPage <- map["current_page"]
        from <- map["from"]
        lastPage <- map["last_page"]
        perPageString <- map["per_page"]
        total <- map["total"]
    }
    
    required init?(map: Map) {

    }
}
