//
//  UIViewController+NavigationBar.swift
//  HW_IOS_2
//
//  Created by Касымжан Гиждуан on 27.04.2022.
//

import UIKit

// MARK: - UIViewController
extension UIViewController {
    func configureNavigationBar(leftImageName: String = "gear", rightImageName: String = "magnifyingglass") {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: rightImageName),
            style: .done,
            target: self,
            action: nil)

        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: leftImageName),
            style: .done,
            target: self,
            action: nil)
    }
}
