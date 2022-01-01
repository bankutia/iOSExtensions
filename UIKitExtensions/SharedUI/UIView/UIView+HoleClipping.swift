//
//  UIView+HoleClipping.swift
//  UIKitExtensions
//
//  Created by ALi on 2021. 06. 21..
//

import UIKit

open class HoleClipper {
    
    private let clippingView: UIView
    private var holeLayer: CAShapeLayer?
    
    public init(clippingView: UIView) {
        self.clippingView = clippingView
    }
    
    open func clipHole(oval rect: CGRect) {
        clipHole(with: UIBezierPath(ovalIn: rect))
    }
    
    open func clipHole(rect: CGRect, cornerRadius: CGFloat) {
        clipHole(with: UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius))
    }
    
    open func clipHole(path: UIBezierPath) {
        clipHole(with: path)
    }
    
    private func clipHole(with holePath: UIBezierPath) {
        if let holeLayer = self.holeLayer {
            holeLayer.removeFromSuperlayer()
        }
        
        let path = UIBezierPath(rect: clippingView.frame)
        path.append(holePath)
        path.usesEvenOddFillRule = true
        path.close()

        let mask = CAShapeLayer()
        mask.path = path.cgPath
        mask.fillRule = .evenOdd

        clippingView.layer.mask = mask
        
        let holeLayer = CAShapeLayer()
        holeLayer.path = holePath.cgPath
        holeLayer.strokeColor = UIColor.white.cgColor
        holeLayer.lineWidth = 1
        holeLayer.contentsScale = UIScreen.main.scale
        clippingView.layer.addSublayer(holeLayer)
        
        self.holeLayer = holeLayer
    }
}
