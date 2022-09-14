//
//  VRViewController.swift
//  GIT-TEST-Flow
//
//  Created by motorist on 13/09/2022.
//

import UIKit

class VRViewController: UIViewController {
    //MARK: - UI Properties and outlets and nothing
    private lazy var vrTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.register(UserCell.self, forCellReuseIdentifier: "UserCell")
        return tableView
    }()

    //MARK: - Life cycle
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.addSubview(vrTableView)
        vrTableView.frame = view.bounds
        
    }

}

//MARK: - Data source
extension VRViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell else {return UITableViewCell()}
        
        return cell
        
    }
    
}

