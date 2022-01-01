//
//  TextStyle+toAttributes.swift
//  UIKitExtensions
//
//  Created by ALi on 2021. 12. 29..
//

import Foundation

public extension TextStyle {
    
    var attributes: [NSAttributedString.Key: Any] {
        [
            .font: font.uiFont,
            .foregroundColor: color.uiColor
        ]
    }
}
