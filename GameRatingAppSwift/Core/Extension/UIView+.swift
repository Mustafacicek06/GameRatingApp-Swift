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
}
