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
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "IndexPath"
        label.textAlignment = .center
        return label
    }()

    //MARK: Life cycle
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.addSubview(userTableView)
        userTableView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height / 2 - 10)
        
        view.addSubview(countLabel)
        countLabel.frame = CGRect(x: 0, y: view.bounds.height / 2, width: view.bounds.width, height: 44)
        
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
        self.countLabel.text = String(indexPath.row)
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? UserCell else {return}

        cell.setupBackgroundColor(color: .cyan)
        
    }
    
}

