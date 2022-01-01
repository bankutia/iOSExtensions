//
//  UIAlertController+makeDefaultActionSheet.swift
//  UIKitExtensions
//
//  Created by ALi on 2021. 08. 11..
//

import Foundation
import UIKit

public extension UIAlertController {
    
    class func makeDefaultActionSheet(withTitle title: String?, withItems items: [ActionSheetItem]) -> UIAlertController {
        
        let actionSheet = UIAlertController (
            title: title,
            message: nil,
            preferredStyle: .actionSheet
        )
        
        items.forEach{ item in
            actionSheet.addAction(UIAlertAction(title: item.title, style: .default, handler:{ _ in
                item.action()
            }))
        }
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:nil))
        
        return actionSheet
    }
}
