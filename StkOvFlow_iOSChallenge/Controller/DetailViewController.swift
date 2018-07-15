//
//  DetailViewController.swift
//  StkOvFlow_iOSChallenge
//
//  Created by Gina De La Rosa on 7/12/18.
//  Copyright © 2018 Gina De La Rosa. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var questionModel:QuestionViewModel?
    
    @IBOutlet weak var detailQuestionTitleLabel: UILabel!
    @IBOutlet weak var detailOwnerDisplayNameLabel: UILabel!
    @IBOutlet weak var detailNumberAnswersLabel: UILabel!
    @IBOutlet weak var detailOwnerProfileImage: UIImageView!
    @IBOutlet weak var detailAnswerBody: UILabel!
    @IBOutlet weak var answersTableView: UITableView!
    
        override func viewDidAppear(_ animated: Bool) {
            detailQuestionTitleLabel.text = questionModel?.title
            detailOwnerDisplayNameLabel.text = questionModel?.displayName
            if let answer = questionModel?.answerAmount {
                detailNumberAnswersLabel?.text = String(answer)
            } else {
                detailNumberAnswersLabel?.text = ""
    
            }
            if let userImage = questionModel?.userImage {
                detailOwnerProfileImage.loadImage(urlString: userImage)
            } else {
                detailOwnerProfileImage.showUnavailableImage()
            }
    
        }
    
        override func viewDidLoad() {
            super.viewDidLoad()
    
        }
    
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
    
        }


    
    

}
