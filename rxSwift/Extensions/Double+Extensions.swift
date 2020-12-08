//
//  Double+Extensions.swift
//  mallers
//
//  Created by Mahmoud Nasser on 8/19/20.
//  Copyright © 2020 Mahmoud Nasser. All rights reserved.
//

import Foundation


extension Double {
    func trimAfter(digit: Int) -> Double? {
        let stringNum = "\(self)"
        if stringNum.count >= digit + 1 {
        let newStringNum = stringNum.subString(from: 0, to: digit)
            return Double(newStringNum)
        } else {
            return self
        }
    }
}
