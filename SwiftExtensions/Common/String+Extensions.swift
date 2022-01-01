//
//  String+Extensions.swift
//  SwiftExtensions
//
//  Created by ALi on 2021. 05. 27..
//

import Foundation

public extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}

public extension Optional where Wrapped == String {
    
    var isNilOrEmpty: Bool {
        self?.isEmpty ?? true
    }
    
    var isNilOrEmptyOrBlank: Bool {
        guard let value = self else {
            return true
        }
        
        return value.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
