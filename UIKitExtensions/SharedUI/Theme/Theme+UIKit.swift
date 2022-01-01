//
//  Theme+UIKit.swift
//  UIKitExtensions
//
//  Created by ALi on 2021. 09. 21..
//

import UIKit

public extension Theme {
    
    var userInterfaceStyle: UIUserInterfaceStyle {
        switch self {
        case .dark:
            return .dark
        case .light:
            return .light
        case .managedBySystem:
            return .unspecified
        }
    }
}
