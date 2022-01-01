//
//  BasePresenter.swift
//  CombineViper
//
//  Created by ALi on 2021. 05. 28..
//

import Combine
import Swinject
import UIKitExtensions

open class BasePresenter: PresenterProtocol, CancellableStore {

    // MARK: - Properties
    
    public var disposeBag: [AnyCancellable] = .init()
    
    // MARK: - Init
    
    public init() {
        
    }
    
    // MARK: - Protocol implementation
    
    open func viewDidLoad() {
        
    }
}

