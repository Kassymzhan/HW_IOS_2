//
//  MyPinsViewController.swift
//  HW_IOS_2
//
//  Created by Касымжан Гиждуан on 18.04.2022.
//

import UIKit

class MyPinsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "My Pins".localized()
        configureNavigationBar()
        navigationController?.navigationBar.tintColor = .label
    }
}

