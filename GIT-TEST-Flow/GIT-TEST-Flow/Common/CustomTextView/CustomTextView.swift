//
//  CustomTextView.swift
//  GIT-TEST-Flow
//
//  Created by Nguyen Minh Tam on 14/09/2022.
//

import UIKit
import SnapKit

class CustomTextView: UIView {
    //MARK: - Properties
    private let customTextView: UITextView = {
        let textView = UITextView()
        textView.layer.borderColor = UIColor.brown.cgColor
        textView.layer.borderWidth = 3
        textView.layer.cornerRadius = 10
        textView.isScrollEnabled = true
        return textView
    }()
    
    private let helperBottomLabel: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    private func setupUI() {
        
        addSubview(customTextView)
        customTextView.snp.makeConstraints { make in
            
            make.top.leading.trailing.equalToSuperview().inset(10)
            
        }
        
        addSubview(helperBottomLabel)
        helperBottomLabel.snp.makeConstraints { make in
            
            make.top.equalTo(customTextView.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview().inset(10)
            
        }
        
    }
    
}

