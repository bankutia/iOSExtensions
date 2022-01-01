//
//  AppStartingUp.swift
//  UIKitExtensions
//
//  Created by ALi on 2021. 05. 27..
//

import UIKit

public protocol AppStartsUpControlling {
    func didFinishLaunching(withOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
}
