//
//  UIView+toImage.swift
//  UIKitExtensions
//
//  Created by ALi on 2021. 06. 21..
//

import UIKit

public extension UIView {

    func asImage() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, 0.0)
        defer { UIGraphicsEndImageContext() }
        if let context = UIGraphicsGetCurrentContext() {
            layer.render(in: context)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            return image
        }
        return nil
    }
}
