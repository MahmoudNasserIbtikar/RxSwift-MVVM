//
//  FileModel.swift
//  rxSwiftExample
//
//  Created by Mahmoud Nasser on 12/22/20.
//

import Foundation
import ObjectMapper

class FileModel: Mappable {
    
    var id: String?
    var path: String?

    func mapping(map: Map) {
        id <- map["id"]
        path <- map["path"]
    }
    
    required init?(map: Map) {

    }
}
