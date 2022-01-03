//
//  BusyIndicatorViewController.swift
//  CombineViper
//
//  Created by ALi on 2021. 07. 04..
//

import UIKit
import UIKitExtensions

public final class BusyIndicatorViewController: UIViewController {
    
    @IBOutlet var holderView: UIView! {
        didSet {
            holderView.layer.apply {
                $0.cornerRadius = 12
                $0.shadowRadius = 5
                $0.shadowColor = UIColor.systemGray.cgColor
                $0.shadowOpacity = 0.7
                $0.shadowOffset = .zero
            }
        }
    }
    @IBOutlet var imageView: UIImageView! {
        didSet {
            imageView.isHidden = true
        }
    }
    @IBOutlet var busyIndicator: UIActivityIndicatorView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = BaseViewController.theme.userInterfaceStyle
        view.backgroundColor = .clear
    }
    
    func setNotifyState() {
        busyIndicator.stopAnimating()
        imageView.isHidden = false
    }
}
