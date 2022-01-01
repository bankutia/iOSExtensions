//
//  UITableViewCell+CellFactoring.swift
//  UIKitExtensions
//
//  Created by ALi on 2021. 08. 28..
//

import UIKit

public protocol CellFactoring: AnyObject { }

public extension UITableViewCell {
    
    static var reuseIdentifier: String {
        String(describing: Self.self)
    }
}
