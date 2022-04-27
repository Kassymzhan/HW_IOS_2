//
//  AddContactsTableViewCell.swift
//  HW_IOS_2
//
//  Created by Касымжан Гиждуан on 22.04.2022.
//

import UIKit

struct Contact: Hashable {
    let title: String
    let icon: String

    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(icon)
    }
}

typealias AddContactsCellConfigurator = TableCellConfigurator<AddContactsTableViewCell, Contact>

class AddContactsTableViewCell: UITableViewCell, ConfigurableCell {
    
    private let AddContactButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .secondaryLabel
        button.contentHorizontalAlignment = .leading
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private let buttonIconImageView: UIImageView = {
        let icon = UIImageView()
        icon.tintColor = .secondaryLabel
        return icon
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutUI()
    }
    
    func configure(data: Contact) {
        AddContactButton.setTitle(data.title, for: .normal)
        buttonIconImageView.image = UIImage(systemName: data.icon)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        accessoryType = .none
    }
    
    private func layoutUI() {
        contentView.addSubview(buttonIconImageView)
        buttonIconImageView.snp.makeConstraints(){
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(screenSize.height * 29 / 926)
        }

        contentView.addSubview(AddContactButton)
        AddContactButton.snp.makeConstraints(){
            $0.leading.equalTo(buttonIconImageView.snp.trailing).offset(8)
            $0.centerY.equalToSuperview()
        }
        AddContactButton.titleLabel?.font = UIFont(name: "KohinoorBangla-Regular", size: screenSize.height * 17 / 926)
    }
}
