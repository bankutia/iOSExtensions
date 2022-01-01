//
//  BaseProtocols.swift
//  CombineViper
//
//  Created by ALi on 2021. 05. 28..
//

import UIKit
import SwiftExtensions

public typealias PresenterProtocol = PresenterInInteractorProtocol & PresenterInViewProtocol

public protocol RouterProtocol: AnyObject {
    var viewController: BaseViewController? { get }
    
    func navigate(to target: UIViewController, animated: Bool, backButtonTitleHidden: Bool)
    func present(_ target: UIViewController, presentationStyle: UIModalPresentationStyle, animated: Bool, completion: @escaping () -> Void)
    func presentNewNavigationFlow(_ target: UIViewController, presentationStyle: UIModalPresentationStyle, animated: Bool, completion: @escaping () -> Void)
    func setRoot(_ target: UIViewController, animated: Bool)
    
    func pop()
    func dismiss()
    func dismissWithCompletion(_ completion: @escaping SimpleActionClosure)
    func popToRoot()
    
    func open(url: URL)
    func presentBusyIndicator()
    func presentBusyIndicator(completion: @escaping SimpleActionClosure)
    func dismissBusyIndicator()
    func dismissBusyIndicator(completion: @escaping SimpleActionClosure)
    func dismissBusyIndicatorWithSuccess(completion: @escaping SimpleActionClosure)
    func present(generalError: Error, completion: SimpleActionClosure?)
    func presentOverCurrentContext(_ target: UIViewController, completion: @escaping SimpleActionClosure)
    func dismissAllDialogs(completed: @escaping () -> Void)
    func resetNavigationStack()
    func forceEndEditing()
    func iPagePresentedModally() -> Bool
}

public protocol PresenterInViewProtocol: AnyObject {
    func viewDidLoad()
}

public protocol PresenterInInteractorProtocol: AnyObject {
    
}

public protocol InteractorProtocol: AnyObject {
    var basePresenter: PresenterInInteractorProtocol? { set get }
}
