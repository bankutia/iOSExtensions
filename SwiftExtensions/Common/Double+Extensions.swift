//
//  Double+Extensions.swift
//  SwiftExtensions
//
//  Created by ALi on 2021. 11. 16..
//

import Foundation

public extension Double {
    var twoDigitsRounded: Double {
        (self * 100).rounded()/100
    }
}
