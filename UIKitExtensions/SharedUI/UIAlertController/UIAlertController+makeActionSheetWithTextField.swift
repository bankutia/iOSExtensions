//
//  UIAlertController+makeActionSheetWithTextField.swift
//  UIKitExtensions
//
//  Created by ALi on 2021. 08. 12..
//

import Foundation
import UIKit
import Combine

public extension UIAlertController {
    
    class func makeActionSheetWithTextField(withTitle title: String?, withPlaceholder placeholder: String?, withSuccessSubject successSubject: PassthroughSubject<String, Never>) -> UIAlertController {
        
        let alert = UIAlertController (
            title: title,
            message: nil,
            preferredStyle: .alert
        )
        
        alert.addTextField { textField in
                textField.placeholder = placeholder
        }
        
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { [weak alert] _ in
            if let typedSignature = alert?.textFields?.element(at: 0)?.text {
                successSubject.send(typedSignature)
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:nil))
        
        return alert
    }
}

