//___FILEHEADER___

import UIKit
import Combine

class ___FILEBASENAMEASIDENTIFIER___: UIView, UIViewLoading {
    
    // MARK: - Outlets

    @IBOutlet var contentView: UIView!
        
    // MARK: - Properties

    // MARK: - Init

    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    // MARK: - Lifecycle
    
    // MARK: - Internals

    private func setupView() {
        loadFromXib()
    }
}
