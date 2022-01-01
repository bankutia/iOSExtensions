//
//  GradientSpecification.swift
//  UIKitExtensions
//
//  Created by ALi on 2021. 05. 07..
//

import Foundation

public typealias Percentage = Int
public typealias Degree = Double

public struct GradientSpecification {
    public var colors: [AbstractColor]
    public var locations: [Percentage]
    public var angle: Degree
}
