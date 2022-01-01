//
//  CALayer+makeImage.swift
//  UIKitExtensions
//
//  Created by ALi on 2021. 05. 07..
//

import UIKit

public extension CALayer {
    
    func makeImage() -> UIImage? {
        UIGraphicsBeginImageContext(frame.size)
        guard let graphicsContext = UIGraphicsGetCurrentContext() else { return nil }
        render(in: graphicsContext)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
