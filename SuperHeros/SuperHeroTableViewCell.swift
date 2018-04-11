//
//  SuperHeroTableViewCell.swift
//  SuperHeros
//
//  Created by Jxr on 14/3/18.
//  Copyright © 2018 xjin0001. All rights reserved.
//

import UIKit

class SuperHeroTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var abilityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
