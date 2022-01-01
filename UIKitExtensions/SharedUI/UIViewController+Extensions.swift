//
//  UIViewController+Extensions.swift
//  UIKitExtensions
//
//  Created by ALi on 2021. 06. 28..
//

import UIKit

public extension UIViewController {
    
    var isVisible: Bool {
        viewIfLoaded?.window != nil 
    }
    
    class func getTopmostViewController(forceUsingTabBarController: Bool = false) -> UIViewController? {
        guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }), let rootViewController = window.rootViewController else {
            return nil
        }
        
        var topController = rootViewController.relevantViewController
        
        while let newTopController = topController.presentedViewController {
            topController = newTopController
        }
        
        return forceUsingTabBarController ? (topController.tabBarController ?? topController) : topController
    }
    
    private var relevantViewController: UIViewController {
        if let tabBarController = self as? UITabBarController {
            return tabBarController.viewControllers?.element(at: tabBarController.selectedIndex) ?? self
        }
        
        return self
    }
    
    var isModal: Bool {
        
        let presentingIsModal = presentedViewController != nil
        let presentingIsNavigation = navigationController?.presentingViewController?.presentedViewController == navigationController && ((navigationController?.viewControllers.count ?? 0) == 1)
        let presentingIsTabBar = tabBarController?.presentingViewController is UITabBarController
        
        return presentingIsModal || presentingIsNavigation || presentingIsTabBar
    }
}
