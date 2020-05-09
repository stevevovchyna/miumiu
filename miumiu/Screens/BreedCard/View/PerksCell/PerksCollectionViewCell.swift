//
//  PerksCollectionViewCell.swift
//  miumiu
//
//  Created by Steven Vovchyna on 27.04.2020.
//  Copyright © 2020 Steven Vovchyna. All rights reserved.
//

import UIKit

class PerksCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var perkImage: UIImageView!
    @IBOutlet weak var perkName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.layer.shadowColor = UIColor.gray.cgColor
        self.contentView.layer.masksToBounds = false
        self.contentView.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        self.contentView.layer.shadowOpacity = 0.4
        self.contentView.layer.shadowRadius = 2.0
    }

}
