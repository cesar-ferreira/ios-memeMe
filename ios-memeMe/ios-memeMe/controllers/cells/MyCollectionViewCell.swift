//
//  MyCollectionViewCell.swift
//  ios-memeMe
//
//  Created by César Ferreira on 16/03/21.
//  Copyright © 2021 César Ferreira. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    static let reuseIdentifier = "MyCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func configureCollectionCell(with image: UIImage) {
        imageView.image = image
    }

    static func nib() -> UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
}
