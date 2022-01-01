//___FILEHEADER___

import UIKit
import Combine
import CombineViper

class ___FILEBASENAMEASIDENTIFIER___: BaseViewController {
    
    // MARK: - Outlets
        
    // MARK: - Properties
    
    var presenter: ___VARIABLE_productName:identifier___PresenterInViewProtocol {
        presenterInView as! ___VARIABLE_productName:identifier___PresenterInViewProtocol
    }
    var viewModel: ___VARIABLE_productName:identifier___.ViewModel {
        presenter.viewModel
    }

    // MARK: - Lifecycle
    
    override func subscribeForViewModelChanges() {
        // TODO: here come the viewModel's subscriptions...
    }
}
