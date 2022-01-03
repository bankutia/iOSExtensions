//
//  CombineViperAppearance.swift
//  CombineViper
//
//  Created by ALi on 2022. 01. 03..
//

import UIKit

public protocol AppearanceProtocol {
    var busyIndicatorImageTintColor: UIColor { get }
}

public class AppearanceManager {
    
    public static var appearance: AppearanceProtocol = DefaultAppearance()
}

struct DefaultAppearance: AppearanceProtocol {
    
    var busyIndicatorImageTintColor: UIColor = .systemGreen
}
