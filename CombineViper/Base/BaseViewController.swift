//
//  BaseViewController.swift
//  CombineViper
//
//  Created by ALi on 2021. 05. 28..
//

import UIKit
import UIKitExtensions
import Combine
import Swinject

open class BaseViewController: UIViewController, CancellableStore {

    public static var theme: Theme = .managedBySystem {
        didSet {
            UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.overrideUserInterfaceStyle = theme.userInterfaceStyle
        }
    }
    
    public var disposeBag: [AnyCancellable] = .init()
    public var presenterInView: PresenterInViewProtocol?

    open override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUserInterfaceStyle()
        if let presenter = presenterInView as? BasePresenter {
            presenter.viewDidLoad()
        }
        
        subscribeForThemeChanges()
        subscribeForViewModelChanges()
    }
    
    open func subscribeForViewModelChanges() {
        
    }
    
    open func setupDefaultAppearance() {
        title = " "
    }
    
    open func subscribeForThemeChanges() {
        NotificationCenter.default.publisher(for: .themeChanged).sink { [weak self] _ in
            self?.setupUserInterfaceStyle()
        }.store(in: &disposeBag)
    }
    
    private func setupUserInterfaceStyle() {
        overrideUserInterfaceStyle = Self.theme.userInterfaceStyle
        navigationController?.overrideUserInterfaceStyle = Self.theme.userInterfaceStyle
    }
}
