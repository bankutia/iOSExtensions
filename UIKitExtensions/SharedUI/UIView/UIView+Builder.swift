//
//  UIView+Builder.swift
//  UIKitExtensions
//
//  Created by ALi on 2021. 06. 29..
//

import UIKit

public extension UIView {
    
    @discardableResult
    func add<T: UIView>(subView: T, decorate: (_ view: T) -> Void, layoutConstraints: (_ parent: UIView, _ child: T) -> [NSLayoutConstraint]) -> T {
        subView.translatesAutoresizingMaskIntoConstraints = false
        decorate(subView)
        addSubview(subView)
        NSLayoutConstraint.activate(layoutConstraints(self, subView))
        
        return subView
    }
    
    func generateStretchingConstraints(for childView: UIView, top: CGFloat = 0, bottom: CGFloat = 0, trailing: CGFloat = 0, leading: CGFloat = 0) -> [NSLayoutConstraint] {
        [childView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leading),
         childView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: trailing),
         childView.topAnchor.constraint(equalTo: topAnchor, constant: top),
         childView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bottom)]
    }
    
    @discardableResult
    func constraintedWidth(_ widthConstant: CGFloat) -> Self {
        NSLayoutConstraint.activate([widthAnchor.constraint(equalToConstant: widthConstant)])
        return self
    }

    @discardableResult
    func constraintedHeight(_ heightConstant: CGFloat) -> Self {
        NSLayoutConstraint.activate([heightAnchor.constraint(equalToConstant: heightConstant)])
        return self
    }
}
