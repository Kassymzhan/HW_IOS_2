//
//  ViewController.swift
//  HW_IOS_2
//
//  Created by Касымжан Гиждуан on 18.04.2022.
//

import UIKit
import SnapKit

struct User {
    var name: String
    var profession: String
    var profilePicture: UIImage
    var status: UIColor
}

class MyFriendsViewController: UIViewController {
    
    private let users = [
        User(name: "Savannah Tucker", profession: "Retail Supervisor", profilePicture: UIImage(named: "Savannah")!, status: .online),
        User(name: "Kathryn Murphy", profession: "Photographer", profilePicture: UIImage(named: "Kathryn")!, status: .online),
        User(name: "Darrell Stewart", profession: "UI/UX Designer", profilePicture: UIImage(named: "Darrell")!, status: .offline),
        User(name: "Jenny Wilson", profession: "Model, Actress", profilePicture: UIImage(named: "Jenny")!, status: .offline),
        User(name: "Courtney Henry", profession: "Taxi Driver", profilePicture: UIImage(named: "Courtney")!, status: .doNotDisturb),
        User(name: "Jim Warren", profession: "Company CEO", profilePicture: UIImage(named: "Jim")!, status: .offline),
        User(name: "Playboi Carti", profession: "Artist", profilePicture: UIImage(named: "Playboi")!, status: .online),
        User(name: "Joseph Adenuga", profession: "Security", profilePicture: UIImage(named: "Joseph")!, status: .doNotDisturb),
        User(name: "Malcolm McCormick", profession: "Pianist", profilePicture: UIImage(named: "Malcolm")!, status: .offline),
    ]

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FriendCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        title = "My Friends".localized()
        configureNavigationBar(leftImageName: "plus.circle", rightImageName: "magnifyingglass")
        navigationController?.navigationBar.tintColor = .label
        collectionViewSetUp()
    }
    
    @objc func didTapAddNewFriend() {
        let vc = AddNewFriendViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func collectionViewSetUp() {
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.snp.makeConstraints(){
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-16)
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        collectionView.backgroundColor = .secondarySystemBackground
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MyFriendsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 2) - 8, height: (collectionView.frame.width / 2) - 8)
    }
}

// MARK: - UICollectionViewDataSource
extension MyFriendsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FriendCell
        cell.data = self.users[indexPath.row]
        return cell
    }
}
