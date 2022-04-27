//
//  CustomFriendCell.swift
//  HW_IOS_2
//
//  Created by Касымжан Гиждуан on 19.04.2022.
//

import UIKit

class FriendCell: UICollectionViewCell {
    
    var data: User? {
        didSet {
            guard let data = data else { return }
            profilePictureImageView.image = data.profilePicture
            nameLabel.text = data.name
            professionLabel.text = data.profession
            statusView.backgroundColor = data.status
        }
    }
    
    private let profilePictureImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "SFProText-Regular", size: 16)
        label.textColor = .label
        return label
    }()
    
    private let professionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let statusView: UIView = {
        let status = UIView()
        status.backgroundColor = .green
        return status
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profilePictureImageView.layer.cornerRadius = (frame.height * 0.57) / 2//enum const
        statusView.layer.cornerRadius = (frame.height * 0.057) / 2
        professionLabel.font = professionLabel.font.withSize(frame.height * 12 / 190)
        nameLabel.font = nameLabel.font.withSize(frame.height * 16 / 190)
        contentView.layer.cornerRadius = frame.height * 12 / 190
    }
    
    private func layoutUI() {
        contentView.addSubview(profilePictureImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(professionLabel)
        contentView.addSubview(statusView)
        
        
        profilePictureImageView.snp.makeConstraints() {
            $0.height.width.equalToSuperview().multipliedBy(0.57)
            $0.top.equalTo(contentView.snp.top).offset(frame.height * 16 / 192)
            $0.centerX.equalTo(contentView)
        }

        nameLabel.snp.makeConstraints() {
            $0.top.equalTo(profilePictureImageView.snp.bottom).offset(frame.height * 19 / 192)
            $0.centerX.equalTo(profilePictureImageView)
        }
        
        professionLabel.snp.makeConstraints() {
            $0.top.equalTo(nameLabel.snp.bottom).offset(frame.height * 4 / 192)
            $0.centerX.equalTo(contentView)
        }
        
        statusView.snp.updateConstraints(){
            $0.height.width.equalToSuperview().multipliedBy(0.057)
            $0.trailing.equalTo(nameLabel.snp.leading).offset(frame.width * -4 / 100)
            $0.centerY.equalTo(nameLabel)
        }
        
        contentView.backgroundColor = .tertiarySystemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    enum Constants {
//        static let widthMultiplier
//    }
}
