//
//  MemeDetailsViewController.swift
//  ios-memeMe
//
//  Created by Altran3496 on 24/03/21.
//  Copyright © 2021 cesar. All rights reserved.
//

import UIKit

class MemeDetailsViewController: UIViewController {

    public var image = UIImage()
    @IBOutlet weak var imageView: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        self.imageView?.image = image
    }
}
