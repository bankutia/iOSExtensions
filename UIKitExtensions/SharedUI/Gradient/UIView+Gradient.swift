//
//  UIView+Gradient.swift
//  UIKitExtensions
//
//  Created by ALi on 2021. 05. 07..
//

import UIKit

public extension UIView {

    @discardableResult
    func apply(gradient: GradientSpecification) -> UIView {
        self.layer.insertSublayer(CAGradientLayer(from: gradient, size: bounds.size), at: 0)
        return self
    }
    
    func update(gradient: GradientSpecification) {
        if let gradientLayer = layer.sublayers?.first(where: { $0 is CAGradientLayer }) {
            gradientLayer.removeFromSuperlayer()
        }
        
        apply(gradient: gradient)
    }
}
