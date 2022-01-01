//
//  UIView+Layout.swift
//  UIKitExtensions
//
//  Created by ALi on 2021. 06. 10..
//

import UIKit

public extension UIView {
    
    func pinSubviewConstraints(toParentView parentView: UIView, useConstantPadding padding: CGFloat = 0) {
        pinSubviewConstraints(toParentView: parentView, topPadding: padding, leftPadding: padding, bottomPadding: padding, rightPadding: padding)
    }

    func pinSubviewConstraints(toParentView parentView: UIView, topPadding: CGFloat = 0, leftPadding: CGFloat = 0, bottomPadding: CGFloat = 0, rightPadding: CGFloat = 0) {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: parentView.topAnchor, constant: topPadding),
            bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: bottomPadding),
            leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: leftPadding),
            trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: rightPadding)
        ])
    }
}
