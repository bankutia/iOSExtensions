//
//  UIViewLoading.swift
//  UIKitExtensions
//
//  Created by ALi on 2021. 07. 06..
//

import UIKit

public protocol UIViewLoading: AnyObject {
    var contentView: UIView! { get }
}

public extension UIViewLoading where Self: UIView {
    
    func loadFromXib() {
        Bundle.main.loadNibNamed(String(describing: Self.self), owner: self, options: nil)
        isUserInteractionEnabled = true
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.pinSubviewConstraints(toParentView: self)
    }
}
