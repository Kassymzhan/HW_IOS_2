//
//  AddFriendCustomButton.swift
//  HW_IOS_2
//
//  Created by Касымжан Гиждуан on 22.04.2022.
//

import UIKit

class AddFriendCustomButton: UIButton {
    
    let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        button.setTitle(" ADD".localized(), for: .normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemBlue.cgColor
        return button
    }()
    
    let addedButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        button.setTitle(" ADDED".localized(), for: .normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.secondaryLabel.cgColor
        button.tintColor = .secondaryLabel
        button.backgroundColor = .tertiarySystemBackground
        return button
    }()
    
    func addFriend(){
        addSubview(addButton)
        addButton.snp.makeConstraints(){
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(30)
            $0.width.equalTo(90)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addedButton.layer.cornerRadius = 30 / 2
        addButton.layer.cornerRadius = (30) / 2
    }
    
    func addedFriend(){
        addSubview(addedButton)
        addedButton.snp.makeConstraints(){
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(30)
            $0.width.equalTo(100)
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
