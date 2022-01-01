//___FILEHEADER___

import Foundation
import Swinject
import CombineViper

class ___FILEBASENAMEASIDENTIFIER___: BasePresenter, ___FILEBASENAMEASIDENTIFIER___InViewProtocol, ___FILEBASENAMEASIDENTIFIER___InInteractorProtocol {
    
    // MARK: - Properties
    
    let viewModel: ___VARIABLE_productName:identifier___.ViewModel = .init()

    private let router: ___VARIABLE_productName:identifier___RouterProtocol
    private let interactor: ___VARIABLE_productName:identifier___InteractorProtocol
    
    // MARK: - Init
    
    init(router: ___VARIABLE_productName:identifier___RouterProtocol, interactor: ___VARIABLE_productName:identifier___InteractorProtocol) {
        self.router = router
        self.interactor = interactor
        super.init()
    }
    
    // MARK: - Protocol implementation

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViewModel()
    }

    // MARK: - Presenter functionality
    
    private func initViewModel() {
        // TODO: ViewModel initialization code comes here...
    }
}
