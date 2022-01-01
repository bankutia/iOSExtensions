//
//  Style+DynamicSize.swift
//  UIKitExtensions
//
//  Created by ALi on 2021. 05. 27..
//

import UIKit

public class DynamicFontScaler {
    
    static let shared = DynamicFontScaler()
    
    let scaleFactor: CGFloat?
    
    public init() {
        let height = UIScreen.main.bounds.height
        let scale = UIScreen.main.scale
        if height > 850 || height == 812 && scale == 2.0 {
            scaleFactor = 6.5
        } else if height < 600 {
            scaleFactor = -6.5
        } else {
            scaleFactor = nil
        }
    }
    
    public class func scaledSize(_ size: CGFloat) -> CGFloat {
        guard let scaleFactor = shared.scaleFactor else { return size }
        return size * (1+scaleFactor/100)
    }
    
    public class func scaled(font: UIFont) -> UIFont {
        UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
    }
}
