//
//  TabBarViewController.swift
//  ios-memeMe
//
//  Created by César Ferreira on 14/03/21.
//  Copyright © 2021 César Ferreira. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    private var TabTitles = [
        "List",
        "Collection"
    ]

    private var tabIcons = [
        UIImage(systemName: "rectangle.grid.1x2.fill"),
        UIImage(systemName: "rectangle.grid.3x2.fill")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        if let tabBarItems = tabBar.items {
            for (index, item) in tabBarItems.enumerated() {
                item.title = TabTitles[index]
                item.image = tabIcons[index]
            }
        }
    }
}
