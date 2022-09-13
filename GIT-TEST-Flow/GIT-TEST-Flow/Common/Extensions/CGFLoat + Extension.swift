//
//  CGFLoat + Extension.swift
//  GIT-TEST-Flow
//
//  Created by motorist on 13/09/2022.
//

import UIKit

extension CGFloat {
    
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
    
}
