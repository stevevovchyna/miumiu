//
//  BreedTableViewCell.swift
//  miumiu
//
//  Created by Steven Vovchyna on 18.04.2020.
//  Copyright © 2020 Steven Vovchyna. All rights reserved.
//

import UIKit

class BreedTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var temperament: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
