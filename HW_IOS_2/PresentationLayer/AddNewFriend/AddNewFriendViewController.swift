//
//  AddNewFriendViewController.swift
//  HW_IOS_2
//
//  Created by Касымжан Гиждуан on 18.04.2022.
//

import UIKit

class AddNewFriendViewController: UIViewController {
    private let contacts: [Contact] = [
        Contact(title: "From Contacts".localized(), icon: "book"),
        Contact(title: "By Username".localized(), icon: "signature"),
        Contact(title: "By Phone Number".localized(), icon: "phone.connection"),
    ]

    private let users: [UserPO] = [
        UserPO(profilePicture: "Keenon", name: "Keenon Jackson", status: .online, numberOfFriends: 2427, addButton: "add"),
        UserPO(profilePicture: "Rakim", name: "Rakim Mayers", status: .online, numberOfFriends: 432, addButton: "add"),
        UserPO(profilePicture: "Tupac", name: "Tupac Shakur", status: .online, numberOfFriends: 2, addButton: "add"),
        UserPO(profilePicture: "Savannah", name: "Savannah Tucker", status: .online, numberOfFriends: 226, addButton: "added"),
        UserPO(profilePicture: "Kathryn", name: "Kathryn Murphy", status: .online, numberOfFriends: 152, addButton: "added"),
        UserPO(profilePicture: "Darrell", name: "Darrell Stewart", status: .offline, numberOfFriends: 1, addButton: "added"),
        UserPO(profilePicture: "Jenny", name: "Jenny Wilson", status: .offline, numberOfFriends: 83, addButton: "added"),
        UserPO(profilePicture: "Courtney", name: "Courtney Henry", status: .doNotDisturb, numberOfFriends: 557, addButton: "added"),
        UserPO(profilePicture: "Jim", name: "Jim Warren", status: .offline, numberOfFriends: 59, addButton: "added"),
        UserPO(profilePicture: "Playboi", name: "Playboi Carti", status: .online, numberOfFriends: 1, addButton: "added"),
        UserPO(profilePicture: "Joseph", name: "Joseph Adenuga", status: .doNotDisturb, numberOfFriends: 967, addButton: "added"),
        UserPO(profilePicture: "Malcolm", name: "Malcolm McCormick", status: .offline, numberOfFriends: 540, addButton: "added"),
    ]
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemBackground
        title = "Add New Friend".localized()
        navigationController?.navigationBar.tintColor = .label
        
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints(){
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

// MARK: - UITableViewDelegate
extension AddNewFriendViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return firstHeaderConfigure()
        } else  {
            return secondHeaderConfigure()
        }
    }
    
    private func firstHeaderConfigure() -> UIView {
        let header = UIView()
        let label = UILabel()
        label.font = UIFont(name: "KohinoorBangla-Semibold", size: screenSize.height * 22 / 926)
        label.text = "Add New Contacts".localized()
        header.addSubview(label)
        label.snp.makeConstraints(){
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        header.backgroundColor = .systemBackground
        return header
    }
    
    private func secondHeaderConfigure() -> UIView {
        let header = UIView()
        let title = UILabel()
        title.font = UIFont(name: "KohinoorBangla-Semibold", size: screenSize.height * 22 / 926)
        title.text = "You Might Know Them".localized()
        header.addSubview(title)
        title.snp.makeConstraints(){
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        let friendsCount = UILabel()
        friendsCount.font = UIFont(name: "KohinoorBangla-Regular", size: screenSize.height * 13 / 926)
        friendsCount.textColor = .secondaryLabel
        friendsCount.text = "(\(users.count))"
        header.addSubview(friendsCount)
        friendsCount.snp.makeConstraints(){
            $0.centerY.equalToSuperview()
            $0.bottom.equalTo(title.snp.bottom)
            $0.leading.equalTo(title.snp.trailing).offset(5)
        }
        header.backgroundColor = .systemBackground
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        screenSize.height / 18
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section) {
        case 0:
            return contacts.count
        case 1:
            return users.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return max(screenSize.height, screenSize.width) / 12
    }
}

// MARK: - UITableViewDataSource
extension AddNewFriendViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch(indexPath.section) {
        case 0:
            let item = contacts[indexPath.row]
            let config = AddContactsCellConfigurator(item: item)
            tableView.register(type(of: config).cellClass, forCellReuseIdentifier: type(of: config).reuseId)
            let cell = tableView.dequeueReusableCell(withIdentifier: type(of: config).reuseId, for: indexPath)
            config.configure(cell: cell)
            return cell
        case 1:
            let item = users[indexPath.row]
            let config = UserCellConfigurator(item: item)
            tableView.register(type(of: config).cellClass, forCellReuseIdentifier: type(of: config).reuseId)
            let cell = tableView.dequeueReusableCell(withIdentifier: type(of: config).reuseId, for: indexPath)
            config.configure(cell: cell)
            return cell
        default:
            let item = users[indexPath.row]
            let config = UserCellConfigurator(item: item)
            tableView.register(type(of: config).cellClass, forCellReuseIdentifier: type(of: config).reuseId)
            let cell = tableView.dequeueReusableCell(withIdentifier: type(of: config).reuseId, for: indexPath)
            config.configure(cell: cell)
            return cell
        }
    }
}
