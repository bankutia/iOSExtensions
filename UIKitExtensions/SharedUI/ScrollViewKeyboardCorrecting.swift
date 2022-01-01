//
//  ScrollViewKeyboardCorrecting.swift
//  netlock
//
//  Created by ALi on 2021. 08. 11..
//

import UIKit

public protocol ScrollViewKeyboardCorrecting {
    var mainScrollView: UIScrollView { get }
}

public extension ScrollViewKeyboardCorrecting where Self: UIViewController&CancellableStore {
    
    func subscribeForKeyboardEvents() {
        NotificationCenter.default.publisher(for: UIResponder.keyboardDidShowNotification).sink { [weak self] notification in
            self?.onKeyboardAppear(notification)
        }.store(in: &disposeBag)
        
        NotificationCenter.default.publisher(for: UIResponder.keyboardDidHideNotification).sink { [weak self] notification in
            self?.onKeyboardDisappear(notification)
        }.store(in: &disposeBag)
    }
    
    func onKeyboardAppear(_ notification: Notification) {
        guard isVisible else { return }
        
        let info = notification.userInfo!
        let rect: CGRect = info[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        let kbSize = rect.size

        let insets = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height, right: 0)
        mainScrollView.contentInset = insets
        mainScrollView.scrollIndicatorInsets = insets
    }

    func onKeyboardDisappear(_ notification: Notification) {
        guard isVisible else { return }
        
        mainScrollView.contentInset = UIEdgeInsets.zero
        mainScrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
}

public protocol ViewKeyboardCorrecting {
    var movableView: UIView { get }
}

public extension ViewKeyboardCorrecting where Self: UIViewController&CancellableStore {
    
    func subscribeForKeyboardEvents() {
        NotificationCenter.default.publisher(for: UIResponder.keyboardDidShowNotification).sink { [weak self] notification in
            self?.onKeyboardAppear(notification)
        }.store(in: &disposeBag)
        
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification).sink { [weak self] notification in
            self?.onKeyboardDisappear(notification)
        }.store(in: &disposeBag)
    }
    
    func onKeyboardAppear(_ notification: Notification) {
        guard isVisible else { return }
        
        let info = notification.userInfo!
        let rect: CGRect = info[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        let kbSize = rect.size

        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.movableView.transform = .init(translationX: 0, y: -kbSize.height)
        }
    }

    func onKeyboardDisappear(_ notification: Notification) {
        guard isVisible else { return }

        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.movableView.transform = .identity
        }
    }
}

