//
//  MyTableViewCell.swift
//  ios-memeMe
//
//  Created by César Ferreira on 21/03/21.
//  Copyright © 2021 César Ferreira. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    static let reuseIdentifier = "MyTableViewCell"

    @IBOutlet weak var memedImage: UIImageView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    static func nib() -> UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
}
