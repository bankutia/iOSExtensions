//
//  UINavigationBar+Gradient.swift
//  UIKitExtensions
//
//  Created by ALi on 2021. 05. 07..
//

import UIKit

public extension UINavigationBar {
    
    func apply(barGradient: GradientSpecification) {
        let gradient = CAGradientLayer(
            from: barGradient,
            size: CGSize(width: bounds.width, height: bounds.height + frame.origin.y)
        )
        setBackgroundImage(gradient.makeImage(), for: .default)
    }
}
