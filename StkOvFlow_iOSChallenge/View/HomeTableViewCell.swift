//
//  HomeTableViewCell.swift
//  StkOvFlow_iOSChallenge
//
//  Created by Gina De La Rosa on 7/12/18.
//  Copyright © 2018 Gina De La Rosa. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var questionTitleLabel: UILabel!
    @IBOutlet weak var ownerDisplayNameLabel: UILabel!
    @IBOutlet weak var numberAnswersLabel: UILabel!
    @IBOutlet weak var ownerProfileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
