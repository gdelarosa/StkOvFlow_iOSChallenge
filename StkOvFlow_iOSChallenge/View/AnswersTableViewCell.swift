//
//  AnswersTableViewCell.swift
//  StkOvFlow_iOSChallenge
//
//  Created by Gina De La Rosa on 7/15/18.
//  Copyright © 2018 Gina De La Rosa. All rights reserved.
//

import UIKit

class AnswersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userDetailProfileImage: UIImageView!
    @IBOutlet weak var userDetailProfileName: UILabel!
    @IBOutlet weak var showAnswerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    var answerViewModel: AnswerViewModel! {
        didSet {
            showAnswerLabel?.text = answerViewModel.answerBody
            userDetailProfileName?.text = answerViewModel.displayName
            if let userImage = answerViewModel.userImage {
                userDetailProfileImage.loadImage(urlString: userImage)
            } else {
                userDetailProfileImage.showUnavailableImage()
            }
        }
    }

}
