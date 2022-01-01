//
//  CancellableStore.swift
//  UIKitExtensions
//
//  Created by ALi on 2021. 12. 29..
//

import Combine

public protocol CancellableStore: AnyObject {
    var disposeBag: [AnyCancellable] { set get }
}

