//
//  ViewController.swift
//  GIT-TEST-Flow
//
//  Created by Nguyen Minh Tam on 12/09/2022.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Properties
    private lazy var userTableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.register(UserCell.self, forCellReuseIdentifier: "UserCell")
        return table
    }()
    
    private lazy var customTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.output = self
        return textField
    }()
    
    private lazy var userNameTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.output = self
        return textField
    }()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    //MARK: - Helpers
    private func setupUI() {
        
        view.addSubview(userTableView)
        userTableView.snp.makeConstraints { make in
            
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(200)
            
        }
        
        let vStack = UIStackView(arrangedSubviews: [customTextField, userNameTextField])
        vStack.axis = .vertical
        vStack.distribution = .fillEqually
        
        view.addSubview(vStack)
        vStack.snp.makeConstraints { make in
            
            make.top.equalTo(userTableView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            
        }
        
        customTextField.snp.makeConstraints { make in
            
            make.height.equalTo(80)
            
        }
        
    }

}

//MARK: - Text field output
extension ViewController: CustomTextFieldProtocol {
    
    func textFieldDidChange(text: String) {
        
        print(text)
        
    }
    
    func textFieldDidEnd(text: String) {
        
        print(text)
        
    }
    
}

//MARK: - Data source
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell else {return UITableViewCell()}
        
        cell.setupBackgroundColor(color: .cyan)
        
        return cell
        
    }
    
}

//MARK: - Delegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? UserCell else {return}
        
        cell.setupBackgroundColor(color: .red)
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? UserCell else {return}

        cell.setupBackgroundColor(color: .cyan)
        
    }
    
}

