//
//  UILabel+Styling.swift
//  UIKitExtensions
//
//  Created by ALi on 2021. 12. 25..
//

import UIKit

public extension UILabel {
    
    @discardableResult
    func apply(abstractFont: AbstractFont, abstractColor: AbstractColor) -> Self {
        self.font = abstractFont.uiFont
        self.textColor = abstractColor.uiColor
        
        return self
    }
    
    @discardableResult
    func set(text: String) -> Self {
        self.text = text
        
        return self
    }
}
