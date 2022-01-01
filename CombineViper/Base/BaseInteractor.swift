//
//  BaseInteractor.swift
//  CombineViper
//
//  Created by ALi on 2021. 05. 28..
//

import Foundation
import Swinject
import Combine
import UIKitExtensions

open class BaseInteractor: InteractorProtocol, CancellableStore {
    
    // MARK: - Properties
    
    public var disposeBag: [AnyCancellable] = .init()
    public weak var basePresenter: PresenterInInteractorProtocol?

    // MARK: - Init
    
    public init() {
        
    }
}
