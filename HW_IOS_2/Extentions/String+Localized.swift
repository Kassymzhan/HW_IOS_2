//
//  String+Localized.swift
//  HW_IOS_2
//
//  Created by Касымжан Гиждуан on 27.04.2022.
//

import Foundation

// MARK: - Localized
extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
