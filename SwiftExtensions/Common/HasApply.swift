//
//  HasApply.swift
//  SwiftExtensions
//
//  Created by ALi on 2021. 05. 27..
//

import Foundation

public protocol HasApply { }

public extension HasApply {
    
    @discardableResult
    func apply(_ closure: (Self) -> Void) -> Self {
        closure(self)
        return self
    }
}

public protocol HasWith { }

public extension HasWith {
    func with(_ closure: (Self) -> Void) {
        closure(self)
    }
}
