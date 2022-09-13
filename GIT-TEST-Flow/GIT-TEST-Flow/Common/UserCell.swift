//
//  UserCell.swift
//  GIT-TEST-Flow
//
//  Created by motorist on 13/09/2022.
//

import UIKit

class UserCell: UITableViewCell {
    //MARK: - Properties

    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    func setupBackgroundColor(color: UIColor) {
        self.backgroundColor = color
        
    }
    
}
