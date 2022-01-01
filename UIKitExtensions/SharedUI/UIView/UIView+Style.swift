//
//  UIView+Style.swift
//  UIKitExtensions
//
//  Created by ALi on 2021. 08. 31..
//

import UIKit

public extension UIView {
    
    @discardableResult
    func apply(abstractBorder border: AbstractBorder) -> Self {
        layer.borderWidth = border.width
        layer.borderColor = border.abstractColor.cgColor
        if let radius = border.cornerRadius {
            layer.cornerRadius = radius
        }
        
        return self
    }
    
    @discardableResult
    func apply(abstractShadow shadow: AbstractShadow) -> Self {
        layer.shadowColor = shadow.abstractColor.cgColor
        if let offset = shadow.offset {
            layer.shadowOffset = offset
        }
        layer.shadowRadius = shadow.radius
        layer.shadowOpacity = shadow.opacity
        
        return self
    }
}
