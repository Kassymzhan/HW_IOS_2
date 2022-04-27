//
//  UserTableViewCell.swift
//  HW_IOS_2
//
//  Created by Касымжан Гиждуан on 21.04.2022.
//

import UIKit

struct UserPO: Hashable {
    let profilePicture: String
    let name: String
    let status: UIColor
    let numberOfFriends: Int
    let addButton: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(profilePicture)
        hasher.combine(name)
        hasher.combine(status)
        hasher.combine(numberOfFriends)
        hasher.combine(addButton)
    }
}

typealias UserCellConfigurator = TableCellConfigurator<UserTableViewCell, UserPO>

class UserTableViewCell: UITableViewCell, ConfigurableCell {
    private let profilePiictureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 24
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let nameLabel = UILabel()
    
    private let statusView = UIView()
    
    private let numberOfFriendsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let addFriendButton = AddFriendCustomButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutUI()
    }
    
    func configure(data: UserPO) {
        profilePiictureImageView.image = UIImage(named: data.profilePicture)
        nameLabel.text = data.name
        statusView.backgroundColor = data.status
        
        if data.numberOfFriends == 1 {
            numberOfFriendsLabel.text = "\(data.numberOfFriends) " + "Friend".localized()
        }else {
            numberOfFriendsLabel.text = "\(data.numberOfFriends) " + "Friends".localized()
        }
        
        let buttonState = data.addButton
        if buttonState == "add" {
            addFriendConfigure()
        }else if buttonState == "added"{
            addedFriendConfigure()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        accessoryType = .none
    }
    
    @objc func didTapAddButton() {
        addFriendButton.addButton.removeFromSuperview()
        addFriendButton.addedButton.layer.cornerRadius = screenSize.height * 30 / 1852
        addedFriendConfigure()
    }
    
    func addedFriendConfigure() {
        contentView.addSubview(addFriendButton.addedButton)
        addFriendButton.addedButton.layoutIfNeeded()
        addFriendButton.addedButton.snp.makeConstraints(){
            $0.width.equalTo(screenSize.width * 110 / 425)
            $0.height.equalTo(screenSize.height * 30 / 926)
            $0.trailing.equalToSuperview().offset(-16)
            $0.centerY.equalToSuperview()
        }
    }
    
    func addFriendConfigure() {
        contentView.addSubview(addFriendButton.addButton)
        addFriendButton.addButton.snp.makeConstraints(){
            $0.width.equalTo(screenSize.width * 110 / 425)
            $0.height.equalTo(screenSize.height * 30 / 926)
            $0.trailing.equalToSuperview().offset(-16)
            $0.centerY.equalToSuperview()
        }
        addFriendButton.addButton.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profilePiictureImageView.layer.cornerRadius = (screenSize.height/18) / 2
        statusView.layer.cornerRadius = (screenSize.height/72) / 2
        statusView.layer.masksToBounds = true
        numberOfFriendsLabel.font = UIFont(name: "KohinoorBangla-Regular", size: screenSize.height * 13 / 926)
        nameLabel.font = UIFont(name: "KohinoorBangla-Semibold", size: screenSize.height * 17 / 926)
        addFriendButton.addButton.layer.cornerRadius = addFriendButton.addButton.frame.height / 2
        addFriendButton.addedButton.layer.cornerRadius = addFriendButton.addedButton.frame.height / 2
    }
    
    private func layoutUI() {
        contentView.addSubview(profilePiictureImageView)
        profilePiictureImageView.snp.makeConstraints(){
            $0.width.height.equalTo(screenSize.height/18)
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }

        contentView.addSubview(statusView)
        statusView.snp.makeConstraints(){
            $0.height.width.equalTo(screenSize.height/72)
            $0.trailing.equalTo(profilePiictureImageView.snp.trailing)
            $0.bottom.equalTo(profilePiictureImageView.snp.bottom)
        }
        
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints(){
            $0.leading.equalTo(profilePiictureImageView.snp.trailing).offset(screenSize.width * 12 / 428)
            $0.trailing.equalToSuperview().offset(-80)
            $0.top.equalTo(profilePiictureImageView.snp.top)
        }

        contentView.addSubview(numberOfFriendsLabel)
        numberOfFriendsLabel.snp.makeConstraints(){
            $0.leading.equalTo(nameLabel.snp.leading)
            $0.trailing.equalToSuperview().offset(-80)
            $0.top.equalTo(nameLabel.snp.bottom)
        }
    }
}
