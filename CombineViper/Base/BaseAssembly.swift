//
//  BaseAssembly.swift
//  CombineViper
//
//  Created by ALi on 2021. 05. 28..
//

import UIKit
import Swinject
import os.log

open class BaseAssembly: Assembly {
    
    public init() { }
    
    open func assemble(container: Container) {
        container.register(BaseViewController.self) { [unowned self] _ in
            self.viewFactory()
        }.initCompleted({ r, baseViewController in
            baseViewController.presenterInView = r.resolve(PresenterInViewProtocol.self)
        }).inObjectScope(.weak)
        container.register(PresenterProtocol.self) { [unowned self] resolver in
            self.presenterFactory(resolver)
        }.inObjectScope(.weak)
        container.register(PresenterInViewProtocol.self) { resolver in
            resolver.resolve(PresenterProtocol.self)!
        }.inObjectScope(.weak)
        container.register(PresenterInInteractorProtocol.self) { resolver in
            resolver.resolve(PresenterProtocol.self)!
        }.inObjectScope(.weak)
        container.register(InteractorProtocol.self) { [unowned self] resolver in
            self.interactorFactory(resolver)
        }.initCompleted({ r, interactor in
            interactor.basePresenter = r.resolve(PresenterInInteractorProtocol.self)
        }).inObjectScope(.weak)
        container.register(RouterProtocol.self) { [unowned self] resolver in
            self.routerFactory(resolver)
        }.inObjectScope(.weak)
    }
    
    open func createModuleViewController() -> BaseViewController? {
        fatalError("Module viewController factory method must be specified!")
    }

    open func viewFactory() -> BaseViewController {
        guard let viewController = createModuleViewController() else {
            fatalError("Module viewController cannot be instantiated!")
        }
        
        return viewController
    }
    
    open func presenterFactory(_ resolver: Resolver) -> PresenterProtocol {
        BasePresenter()
    }
    
    open func interactorFactory(_ resolver: Resolver) -> InteractorProtocol {
        BaseInteractor()
    }
    
    open func routerFactory(_ resolver: Resolver) -> RouterProtocol {
        BaseRouter(viewController: resolver.resolve(BaseViewController.self)!)
    }
}
