//
//  ViewController.swift
//  GIT-TEST-Flow
//
//  Created by Nguyen Minh Tam on 12/09/2022.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Outlets
    //MARK: Properties
    private lazy var userTableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.register(UserCell.self, forCellReuseIdentifier: "UserCell")
        return table
    }()

    //MARK: View cycle
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.addSubview(userTableView)
        userTableView.frame = view.bounds
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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

