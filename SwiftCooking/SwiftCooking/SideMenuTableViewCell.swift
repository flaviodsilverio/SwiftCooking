//
//  SideMenuTableViewCell.swift
//  SwiftCooking
//
//  Created by Mário Filipe Farate Marques on 21/05/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
