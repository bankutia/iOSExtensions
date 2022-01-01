//
//  UITextField+Binding.swift
//  progressX
//
//  Created by ALi on 2021. 05. 28..
//  Copyright © 2021. mobilefriends. All rights reserved.
//

import UIKit
import Combine
import CombineCocoa

public class BindableTextField: UITextField, CancellableStore {
    
    public var disposeBag: [AnyCancellable] = .init()
    
    public func bind(to publishedValue: AnyPublisher<String?, Never>, valueSetter: @escaping (String?) -> Void) {
        publishedValue
            .assign(to: \.text, on: self)
            .store(in: &disposeBag)
        textPublisher.sink { text in
            valueSetter(text)
        }.store(in: &disposeBag)
    }
}

public extension UITextView {
    
    func bind(to publishedValue: Published<String?>.Publisher, display: CancellableStore, valueSetter: @escaping (String?) -> Void) {
        publishedValue
            .assign(to: \.text, on: self)
            .store(in: &display.disposeBag)
        textPublisher.sink { text in
            valueSetter(text)
        }.store(in: &display.disposeBag)
    }
}
