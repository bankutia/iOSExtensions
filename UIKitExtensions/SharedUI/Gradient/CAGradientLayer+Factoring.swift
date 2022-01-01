//
//  CAGradientLayer+Angle.swift
//  UIKitExtensions
//
//  Created by ALi on 2021. 05. 07..
//

import UIKit

public extension CAGradientLayer {
    
    convenience init(from gradient: GradientSpecification, size: CGSize) {
        self.init()
        frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        colors = gradient.colors.map { $0.cgColor }
        locations = gradient.locations.map { NSNumber(floatLiteral: Double($0) / 100) }
        apply(angle: gradient.angle + 90)
    }
    
    func apply(angle : Double) {
        let x: Double! = angle / 360.0
        let a = pow(sinf(Float(2.0 * Double.pi * ((x + 0.75) / 2.0))),2.0);
        let b = pow(sinf(Float(2*Double.pi*(x/2.0))),2.0);
        let c = pow(sinf(Float(2*Double.pi*((x+0.25)/2.0))),2.0);
        let d = pow(sinf(Float(2*Double.pi*((x+0.5)/2.0))),2.0);

        endPoint = CGPoint(x: CGFloat(c),y: CGFloat(d))
        startPoint = CGPoint(x: CGFloat(a),y:CGFloat(b))
    }
}

