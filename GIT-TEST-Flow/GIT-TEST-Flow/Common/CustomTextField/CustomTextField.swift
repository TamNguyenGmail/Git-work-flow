//
//  CustomTextField.swift
//  GIT-TEST-Flow
//
//  Created by Nguyen Minh Tam on 14/09/2022.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift

protocol CustomTextFieldProtocol: AnyObject {
    func textFieldDidChange(text: String)
    func textFieldDidEnd(text: String)
}

class CustomTextField: UIView {
    //MARK: - Properties
    private let inputTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.brown.cgColor
        return textField
    }()
    
    weak var output: CustomTextFieldProtocol?
    private var disposeBag = DisposeBag()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        implementRx()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    private func setupUI() {
        
        addSubview(inputTextField)
        inputTextField.snp.makeConstraints{ make in
            
            make.edges.equalToSuperview().inset(10)
             
        }
        
    }
    
    func implementRx() {
        
        self.disposeBag = DisposeBag()
        
        inputTextField.rx.controlEvent(.editingChanged).subscribe(onNext: { [weak self] in
            guard let this = self, let output = this.output else {return}
            
            output.textFieldDidChange(text: this.inputTextField.text ?? "")
            
        }).disposed(by: self.disposeBag)
        
        inputTextField.rx.controlEvent(.editingDidEnd).subscribe(onNext: { [weak self] in
            guard let this = self, let output = this.output else {return}
            
            output.textFieldDidEnd(text: this.inputTextField.text ?? "")
            
        }).disposed(by: self.disposeBag)
        
    }

}
