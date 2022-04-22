//
//  AddNewFriendViewController.swift
//  HW_IOS_2
//
//  Created by Касымжан Гиждуан on 18.04.2022.
//

import UIKit



class AddNewFriendViewController: UIViewController {
    
    struct Objects {
        var sectionName: String!
        var sectionObject: CellConfigurator!
    }

    var objectArray = [Objects]()
    
    private let items1: [CellConfigurator] = [
        AddContactsCellConfigurator(item: AddContacts(title: "From Contacts".localized(), icon: "book")),
        AddContactsCellConfigurator(item: AddContacts(title: "By Username".localized(), icon: "signature")),
        AddContactsCellConfigurator(item: AddContacts(title: "By Phone Number".localized(), icon: "phone.connection")),
    ]

    private let items2: [CellConfigurator] = [
        UserCellConfigurator(item: User(profilePicture: "Keenon", name: "Keenon Jackson", status: online, numberOfFriends: 2427, addButton: true)),
        UserCellConfigurator(item: User(profilePicture: "Rakim", name: "Rakim Mayers", status: online, numberOfFriends: 432, addButton: true)),
        UserCellConfigurator(item: User(profilePicture: "Tupac", name: "Tupac Shakur", status: online, numberOfFriends: 2, addButton: true)),
        UserCellConfigurator(item: User(profilePicture: "Savannah", name: "Savannah Tucker", status: online, numberOfFriends: 226, addButton: false)),
        UserCellConfigurator(item: User(profilePicture: "Kathryn", name: "Kathryn Murphy", status: online, numberOfFriends: 152, addButton: false)),
        UserCellConfigurator(item: User(profilePicture: "Darrell", name: "Darrell Stewart", status: offline, numberOfFriends: 1, addButton: false)),
        UserCellConfigurator(item: User(profilePicture: "Jenny", name: "Jenny Wilson", status: offline, numberOfFriends: 83, addButton: false)),
        UserCellConfigurator(item: User(profilePicture: "Courtney", name: "Courtney Henry", status: doNotDisturb, numberOfFriends: 557, addButton: false)),
        UserCellConfigurator(item: User(profilePicture: "Jim", name: "Jim Warren", status: offline, numberOfFriends: 59, addButton: false)),
        UserCellConfigurator(item: User(profilePicture: "Playboi", name: "Playboi Carti", status: online, numberOfFriends: 1, addButton: false)),
        UserCellConfigurator(item: User(profilePicture: "Joseph", name: "Joseph Adenuga", status: doNotDisturb, numberOfFriends: 967, addButton: false)),
        UserCellConfigurator(item: User(profilePicture: "Malcolm", name: "Malcolm McCormick", status: offline, numberOfFriends: 540, addButton: false)),
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
        friendsCount.text = "(\(items2.count))"
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
            return items1.count
        case 1:
            return items2.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return max(screenSize.height, screenSize.width) / 12
    }
}

extension AddNewFriendViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch(indexPath.section) {
        case 0:
            let item = items1[indexPath.row]
            tableView.register(type(of: item).cellClass, forCellReuseIdentifier: type(of: item).reuseId)
            let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId, for: indexPath)
            item.configure(cell: cell)
            return cell
        case 1:
            let item = items2[indexPath.row]
            tableView.register(type(of: item).cellClass, forCellReuseIdentifier: type(of: item).reuseId)
            let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId, for: indexPath)
            item.configure(cell: cell)
            return cell
        default:
            let item = items2[indexPath.row]
            tableView.register(type(of: item).cellClass, forCellReuseIdentifier: type(of: item).reuseId)
            let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId, for: indexPath)
            item.configure(cell: cell)
            return cell
        }
    }
}
