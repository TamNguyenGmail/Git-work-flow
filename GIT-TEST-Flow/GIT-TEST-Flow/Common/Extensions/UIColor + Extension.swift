//
//  UIColor + Extension.swift
//  GIT-TEST-Flow
//
//  Created by motorist on 13/09/2022.
//

import UIKit

extension UIColor {
    
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
    
}
