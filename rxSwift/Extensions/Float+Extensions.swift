//
//  Float+Extensions.swift
//  mallers
//
//  Created by Mahmoud Nasser on 7/6/20.
//  Copyright © 2020 Mahmoud Nasser. All rights reserved.
//

import Foundation

extension Float {
    func roundedOneDigit() -> Float {
        let twoDigitNum = self * 10
        var roundedNum = twoDigitNum.rounded()
        roundedNum = roundedNum / 10
        return roundedNum
    }
}
