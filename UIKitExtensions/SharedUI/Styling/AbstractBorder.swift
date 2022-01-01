//
//  AbstractBorder.swift
//  UIKitExtensions
//
//  Created by ALi on 2021. 12. 28..
//

import UIKit

public protocol AbstractBorder {
    var width: CGFloat { get }
    var abstractColor: AbstractColor { get }
    var cornerRadius: CGFloat? { get }
}
