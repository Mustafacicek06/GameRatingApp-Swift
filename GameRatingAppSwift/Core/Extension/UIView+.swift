//
//  UIView+.swift
//  GameRatingAppSwift
//
//  Created by Mustafa Çiçek on 10.09.2022.
//

import UIKit

public extension UIView {
    
    func pinTo (_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            heightAnchor.constraint(equalToConstant: 50),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
        ])
        
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero)  {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top,constant: padding.top).isActive = true

        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading,constant: padding.left).isActive = true
        }
        
        if let trailing = trailing {
            
            trailingAnchor.constraint(equalTo: trailing,constant: -padding.right).isActive = true
        }
      
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
    }
}
