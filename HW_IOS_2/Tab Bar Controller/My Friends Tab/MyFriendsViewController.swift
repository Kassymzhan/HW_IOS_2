//
//  ViewController.swift
//  HW_IOS_2
//
//  Created by Касымжан Гиждуан on 18.04.2022.
//

import UIKit
import SnapKit

struct CustomData {
    var name: String
    var profession: String
    var profilePicture: UIImage
    var status: UIColor
}

let online = UIColor(red: 52/255, green: 199/255, blue: 89/255, alpha: 1)
let offline = UIColor(red: 220/255, green: 220/255, blue: 221/255, alpha: 1)
let doNotDisturb = UIColor(red: 1, green: 204/255, blue: 0, alpha: 1)

class MyFriendsViewController: UIViewController {
    
    let data = [CustomData(name: "Savannah Tucker", profession: "Retail Supervisor", profilePicture: UIImage(named: "Savannah")!, status: online),
                CustomData(name: "Kathryn Murphy", profession: "Photographer", profilePicture: UIImage(named: "Kathryn")!, status: online),
                CustomData(name: "Darrell Stewart", profession: "UI/UX Designer", profilePicture: UIImage(named: "Darrell")!, status: offline),
                CustomData(name: "Jenny Wilson", profession: "Model, Actress", profilePicture: UIImage(named: "Jenny")!, status: offline),
                CustomData(name: "Courtney Henry", profession: "Taxi Driver", profilePicture: UIImage(named: "Courtney")!, status: doNotDisturb),
                CustomData(name: "Jim Warren", profession: "Company CEO", profilePicture: UIImage(named: "Jim")!, status: offline),
                CustomData(name: "Playboi Carti", profession: "Artist", profilePicture: UIImage(named: "Playboi")!, status: online),
                CustomData(name: "Joseph Adenuga", profession: "Security", profilePicture: UIImage(named: "Joseph")!, status: doNotDisturb),
                CustomData(name: "Malcolm McCormick", profession: "Pianist", profilePicture: UIImage(named: "Malcolm")!, status: offline),
    ]

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CustomFriendCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        title = "My Friends".localized()
        configureMyFriendsNavigationBar()
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
    
    private func configureMyFriendsNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "magnifyingglass"),
            style: .done,
            target: self,
            action: nil)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus.circle"),
            style: .done,
            target: self,
            action: #selector(didTapAddNewFriend))
    }
}

extension MyFriendsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width/2) - 8, height: (collectionView.frame.width/2) - 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
}

extension MyFriendsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomFriendCell
        cell.data = self.data[indexPath.row]
        return cell
    }
}
