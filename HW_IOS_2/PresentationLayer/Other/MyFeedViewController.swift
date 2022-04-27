//
//  MyFeedViewController.swift
//  HW_IOS_2
//
//  Created by Касымжан Гиждуан on 18.04.2022.
//

import UIKit

class MyFeedViewController: UIViewController {
  
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "My Feed".localized()
        configureNavigationBar()
        navigationController?.navigationBar.tintColor = .label
        
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
}

// MARK: - UITableViewDataSource
extension MyFeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "My Feed \(indexPath.row + 1)"
        return cell
    }
}
