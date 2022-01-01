//
//  TextStyle.swift
//  UIKitExtensions
//
//  Created by ALi on 2021. 12. 25..
//

import Foundation

public struct TextStyle {
    public var font: AbstractFont
    public var color: AbstractColor
    
    public init(font: AbstractFont, color: AbstractColor) {
        self.font = font
        self.color = color
    }
}

