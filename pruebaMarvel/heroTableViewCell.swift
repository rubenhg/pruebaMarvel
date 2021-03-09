//
//  heroTableViewCell.swift
//  pruebaMarvel
//
//  Created by ruben on 08/03/2021.
//  Copyright © 2021 ruben. All rights reserved.
//

import UIKit

class heroTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var photo: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
