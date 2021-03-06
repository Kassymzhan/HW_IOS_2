//
//  ConfigurableCell.swift
//  HW_IOS_2
//
//  Created by Касымжан Гиждуан on 21.04.2022.
//

import Foundation

protocol ConfigurableCell {
    associatedtype DataType
    static var reuseIdentifier: String { get }
    func configure(data: DataType)
}

// MARK: - ConfigurableCell
extension ConfigurableCell {
    static var reuseIdentifier: String { return String(describing: Self.self) }
}
