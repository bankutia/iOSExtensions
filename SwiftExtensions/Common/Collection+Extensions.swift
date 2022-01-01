//
//  Collection+Extensions.swift
//  SwiftExtensions
//
//  Created by ALi on 2021. 05. 27..
//

import Foundation

public extension RandomAccessCollection {
    var isNotEmpty: Bool {
        return !isEmpty
    }
}

public extension Array where Element: Equatable {
    func notContains(_ element: Element) -> Bool {
        !contains(element)
    }

    func element(at index: Int) -> Element? {
        guard index < count, index >= 0 else { return nil }
        
        return self[index]
    }
}

public extension Sequence {
    func all(_ closure: (Element) -> Bool) -> Bool {
        !self.any { !closure($0) }
    }

    func any(_ closure: (Element) -> Bool) -> Bool {
        self.first(where: { closure($0) }) != nil
    }
}

public extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

public extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
