//
//  UIButton+Style.swift
//  UIKitExtensions
//
//  Created by ALi on 2021. 08. 30..
//

import UIKit

public extension UIButton {
    
    func setBackgroundColor(_ backgroundColor: UIColor, for state: UIControl.State) {
        self.setBackgroundImage(.pixel(ofColor: backgroundColor), for: state)
    }
    
    func apply(title: String, style: TextStyle) {
        setAttributedTitle(
            NSAttributedString(
                string: title,
                attributes: [
                    .font: style.font.uiFont,
                    .foregroundColor: style.color.uiColor
                ]),
            for: .normal)
        setAttributedTitle(
            NSAttributedString(
                string: title,
                attributes: [
                    .font: style.font.uiFont,
                    .foregroundColor: style.color.uiColor.withAlphaComponent(0.7)
                ]),
            for: .highlighted)
        adjustsImageWhenHighlighted = false
    }
}
