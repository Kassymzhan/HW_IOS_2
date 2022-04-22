//
//  ViewController.swift
//  HW_IOS_2
//
//  Created by Касымжан Гиждуан on 18.04.2022.
//

import UIKit

let screenSize: CGRect = UIScreen.main.bounds

class MyAppTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        tabBarSetUp()
    }
    
    private func tabBarSetUp() {
        let myFeedNavigationController = UINavigationController(rootViewController: MyFeedViewController())
        let tabOneBarItem = UITabBarItem(
            title: "My Feed".localized(),
            image: UIImage(systemName: "photo.fill.on.rectangle.fill"),
            selectedImage: UIImage(systemName: "photo.fill.on.rectangle.fill"))
        myFeedNavigationController.tabBarItem = tabOneBarItem

        let myFriendsNavigationController = UINavigationController(rootViewController: MyFriendsViewController())
        let tabTwoBarItem = UITabBarItem(
            title: "My Friends".localized(),
            image: UIImage(systemName: "person.2.fill"),
            selectedImage: UIImage(systemName: "person.2.fill"))
        myFriendsNavigationController.tabBarItem = tabTwoBarItem

        let myPinsNavigationController = UINavigationController(rootViewController: MyPinsViewController())
        let tabThreeBarItem = UITabBarItem(
            title: "My Pins".localized(),
            image: UIImage(systemName: "pin.fill"),
            selectedImage: UIImage(systemName: "pin.fill"))
        myPinsNavigationController.tabBarItem = tabThreeBarItem

        let myProfileNavigationController = UINavigationController(rootViewController: MyProfileViewController())
        let tabFourBarItem = UITabBarItem(
            title: "My Profile".localized(),
            image: UIImage(systemName: "person.crop.rectangle.stack"),
            selectedImage: UIImage(systemName: "person.crop.rectangle.stack"))
        myProfileNavigationController.tabBarItem = tabFourBarItem

        viewControllers = [myFeedNavigationController, myFriendsNavigationController, myPinsNavigationController, myProfileNavigationController]
    }
}

extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
