//
//  BaseRouter.swift
//  CombineViper
//
//  Created by ALi on 2021. 05. 28..
//

import UIKit
import SwiftExtensions
import UIKitExtensions
import Swinject
import Moya
import Combine

open class BaseRouter: RouterProtocol, CancellableStore {
    
    // MARK: - Properties
    
    public var disposeBag: [AnyCancellable] = .init()
    public weak var viewController: BaseViewController?
    
    // MARK: - Initialize

    public init(viewController: BaseViewController?) {
        self.viewController = viewController
    }
    
    // MARK: - Static members
    
    public static func setApplicationRoot(_ target: UIViewController) {
        guard let window = UIApplication.shared.windows.first else {
            fatalError("Main window not instantiated yet!")
        }
        
        window.rootViewController = target
        window.makeKeyAndVisible()
    }
    
    public static func setApplicationRoot(_ vc: UIViewController, animated: Bool) {
        guard animated, let window = UIApplication.shared.windows.first else {
            UIApplication.shared.windows.first?.rootViewController = vc
            UIApplication.shared.windows.first?.makeKeyAndVisible()
            return
        }

        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
    
    // MARK: - RouterProtocol
    
    public func navigate(to target: UIViewController, animated: Bool = true, backButtonTitleHidden: Bool = true) {
        guard let navigationController = viewController?.navigationController else {
            fatalError("No navigation controller for navigating!")
        }

        target.hidesBottomBarWhenPushed = true
        if backButtonTitleHidden {
            viewController?.navigationItem.backButtonTitle = " "
            navigationController.navigationItem.backButtonTitle = " "
        }
        navigationController.pushViewController(target, animated: animated)
    }
    
    public func present(_ target: UIViewController, presentationStyle: UIModalPresentationStyle = .fullScreen, animated: Bool = true, completion: @escaping () -> Void = {}) {
        target.modalPresentationStyle = presentationStyle
        viewController?.present(target, animated: animated, completion: completion)
    }
    
    public func presentNewNavigationFlow(_ target: UIViewController, presentationStyle: UIModalPresentationStyle = .fullScreen, animated: Bool = true, completion: @escaping () -> Void = {}) {
        let navigationController = UINavigationController(rootViewController: target)
        navigationController.modalPresentationStyle = presentationStyle
        viewController?.present(navigationController, animated: animated, completion: completion)
    }
    
    public func setRoot(_ target: UIViewController, animated: Bool) {
        guard let navigationController = viewController?.navigationController else {
            fatalError("No navigation controller for setting root!")
        }
        
        navigationController.setViewControllers([target], animated: true)
    }
    
    public func pop() {
        guard let navigationController = viewController?.navigationController else {
            fatalError("No navigation controller for popping!")
        }
        
        navigationController.popViewController(animated: true)
    }
    
    public func popToRoot() {
        guard let navigationController = viewController?.navigationController else {
            fatalError("No navigation controller for popping!")
        }
        
        navigationController.popToRootViewController(animated: true)
    }
    
    public func dismiss() {
        viewController?.dismiss(animated: true, completion: nil)
    }
    
    public func dismissWithCompletion(_ completion: @escaping SimpleActionClosure) {
        viewController?.dismiss(animated: true, completion: completion)
    }

    public func open(url: URL) {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }

    public func presentBusyIndicator(completion: @escaping SimpleActionClosure) {
        guard let viewController = viewController,
              viewController.isVisible,
              !(viewController.presentedViewController is BusyIndicatorViewController),
              let busyIndicator = UIStoryboard(name: "Base", bundle: Bundle(for: type(of: self))).instantiateInitialViewController() else { return }
        
        busyIndicator.modalPresentationStyle = .overCurrentContext
        busyIndicator.modalTransitionStyle = .crossDissolve
        viewController.present(busyIndicator, animated: true, completion: completion)
    }
    
    public func presentBusyIndicator() {
        presentBusyIndicator { }
    }
    
    public func dismissBusyIndicator(completion: @escaping SimpleActionClosure = { }) {
        guard let busyIndicator = viewController?.presentedViewController as? BusyIndicatorViewController else {
            return
        }
        
        busyIndicator.dismiss(animated: true, completion: completion)
    }
    
    public func dismissBusyIndicator() {
        dismissWithCompletion { }
    }
    
    public func dismissBusyIndicatorWithSuccess(completion: @escaping SimpleActionClosure) {
        guard let busyIndicator = viewController?.presentedViewController as? BusyIndicatorViewController else {
            return
        }
        
        busyIndicator.setNotifyState()
        Just(()).delay(for: .seconds(1), scheduler: DispatchQueue.main).sink {
            busyIndicator.dismiss(animated: true, completion: completion)
        }.store(in: &disposeBag)
    }
    
    public func present(generalError: Error, completion: SimpleActionClosure?) {
        present(
            UIAlertController.makeSimpleNotifyAlert(
                title: "General error",
                message: generalError.localizedDescription,
                acknowledgeAction: { completion?() }
            ),
            animated: true,
            completion: { }
        )
    }
    
    public func presentOverCurrentContext(_ target: UIViewController, completion: @escaping SimpleActionClosure) {
        target.apply {
            $0.modalTransitionStyle = .crossDissolve
        }
        
        present(target, presentationStyle: .overCurrentContext, animated: true, completion: completion)
    }
    
    public func dismissAllDialogs(completed: @escaping () -> Void) {
        
        if let topmostViewController = UIViewController.getTopmostViewController() {
            if !(topmostViewController is UINavigationController) {
                topmostViewController.dismiss(animated: true, completion: { [weak self] in
                    self?.dismissAllDialogs(completed: completed)
                })
            } else {
                completed()
            }
        }
    }
    
    public func resetNavigationStack() {
        guard let navigationController = viewController?.navigationController else { return }
        
        navigationController.viewControllers = navigationController.viewControllers.suffix(1)
    }
    
    public func forceEndEditing() {
        viewController?.view.endEditing(true)
    }
    
    public func iPagePresentedModally() -> Bool {
        (viewController?.navigationController?.viewControllers.count == 1) 
    }
}
