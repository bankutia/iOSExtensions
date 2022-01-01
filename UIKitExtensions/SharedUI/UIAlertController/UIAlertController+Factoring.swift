//
//  UIAlertController+Factoring.swift
//  UIKitExtensions
//
//  Created by ALi on 2021. 06. 02..
//

import UIKit
import SwiftExtensions

public protocol ActionSheetItem {
    var image: UIImage? {get set}
    var title: String {get set}
    var action: SimpleActionClosure {get set}
}

public extension UIAlertController {

    class func makeSimpleNotifyAlert(title: String, message: String, acknowledgeAction: @escaping () -> Void) -> UIAlertController {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(.init(title: "OK", style: .default, handler: { _ in
            acknowledgeAction()
        }))
        
        return alert
    }
    
    class func makeDecisionAlert(title: String, message: String, acceptClosure: @escaping SimpleActionClosure, rejectClosure: @escaping SimpleActionClosure) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "Yes", style: .default, handler: { _ in
            acceptClosure()
        }))
        alert.addAction(.init(title: "No", style: .default, handler: { _ in
            rejectClosure()
        }))
        
        return alert
    }
    
    class func makeActionSheet(withTitle title: String, withMessage message: String, withItems items: [ActionSheetItem]) -> UIAlertController {
        
        let actionSheet = UIAlertController (
            title: title,
            message: message,
            preferredStyle: .actionSheet
        )
        
        items.forEach{ item in
            actionSheet.addAction(UIAlertAction(title: item.title.capitalized, style: .default, handler:{ _ in
                item.action()
          }))
        }
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:nil))
        
        return actionSheet
    }
}
