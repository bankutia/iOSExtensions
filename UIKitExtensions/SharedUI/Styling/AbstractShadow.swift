//
//  AbstractShadow.swift
//  UIKitExtensions
//
//  Created by ALi on 2021. 12. 28..
//

import UIKit

public protocol AbstractShadow {
    var abstractColor: AbstractColor { get }
    var offset: CGSize? { get }
    var radius: CGFloat { get }
    var opacity: Float { get }
}
