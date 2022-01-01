//
//  UIImage+createFromColor.swift
//  UIKitExtensions
//
//  Created by ALi on 2021. 09. 22..
//

import UIKit

public extension UIImage {

    static func pixel(ofColor color: UIColor) -> UIImage {
        let lightModeImage = UIImage.generatePixel(ofColor: color, userInterfaceStyle: .light)
        let darkModeImage = UIImage.generatePixel(ofColor: color, userInterfaceStyle: .dark)
        lightModeImage.imageAsset?.register(darkModeImage, with: UITraitCollection(userInterfaceStyle: .dark))
        return lightModeImage
    }
    
    static private func generatePixel(ofColor color: UIColor, userInterfaceStyle: UIUserInterfaceStyle) -> UIImage {
        var image: UIImage!
        UITraitCollection(userInterfaceStyle: userInterfaceStyle).performAsCurrent {
            image = .generatePixel(ofColor: color)
        }
        return image
    }
    
    static private func generatePixel(ofColor color: UIColor) -> UIImage {
        let pixel = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        
        UIGraphicsBeginImageContext(pixel.size)
        defer { UIGraphicsEndImageContext() }
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return UIImage()
        }
        
        context.setFillColor(color.cgColor)
        context.fill(pixel)
        
        return UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
    }
}
