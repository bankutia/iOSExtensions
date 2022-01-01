//___FILEHEADER___

import Foundation
import Swinject
import CombineViper

class ___FILEBASENAMEASIDENTIFIER___: BaseAssembly {
    
    override func createModuleViewController() -> BaseViewController? {
        R.storyboard.___VARIABLE_productName:identifier___.instantiateInitialViewController()
    }
    
    override func presenterFactory(_ resolver: Resolver) -> PresenterProtocol {
        ___VARIABLE_productName:identifier___Presenter(
            router: resolver.resolve(RouterProtocol.self) as! ___VARIABLE_productName:identifier___RouterProtocol,
            interactor: resolver.resolve(InteractorProtocol.self) as! ___VARIABLE_productName:identifier___InteractorProtocol
        )
    }
    
    override func interactorFactory(_ resolver: Resolver) -> InteractorProtocol {
        ___VARIABLE_productName:identifier___Interactor()
    }
    
    override func routerFactory(_ resolver: Resolver) -> RouterProtocol {
        ___VARIABLE_productName:identifier___Router(viewController: resolver.resolve(BaseViewController.self)!)
    }
}
