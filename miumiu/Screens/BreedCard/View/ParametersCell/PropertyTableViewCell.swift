//
//  PropertyTableViewCell.swift
//  miumiu
//
//  Created by Steven Vovchyna on 25.04.2020.
//  Copyright © 2020 Steven Vovchyna. All rights reserved.
//

import UIKit

class PropertyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var parameterName: UILabel!
    @IBOutlet weak var circlesView: UIStackView!
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var rightView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        leftView.layer.cornerRadius = 8
        leftView.layer.maskedCorners = [.layerMinXMinYCorner,
                                        .layerMinXMaxYCorner]
        rightView.layer.cornerRadius = 8
        rightView.layer.maskedCorners = [.layerMaxXMaxYCorner,
                                         .layerMaxXMinYCorner]
        
        self.contentView.layer.shadowColor = UIColor.gray.cgColor
        self.contentView.layer.masksToBounds = false
        self.contentView.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        self.contentView.layer.shadowOpacity = 0.4
        self.contentView.layer.shadowRadius = 2.0
    }

}
