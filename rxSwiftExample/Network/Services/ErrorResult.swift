//
//  ErrorResult.swift
//  mallers
//
//  Created by Mahmoud Nasser on 5/10/20.
//  Copyright © 2020 Mahmoud Nasser. All rights reserved.
//

import Foundation

enum ErrorResult: Error {
    case network(string: String)
    case custom(string: String)
}
