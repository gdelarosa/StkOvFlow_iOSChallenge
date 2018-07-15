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
    
    @IBOutlet weak var questionTitle: UILabel!
    @IBOutlet weak var displayName: UILabel!
    @IBOutlet weak var reputation: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var answerBody: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        questionTitle.text = questionModel?.title
        displayName.text = questionModel?.displayName
        
//        if let reputation = questionModel?.answerAmount {
//            reputation.text = String(reputation)
//        } else {
//            reputation?.text = ""
//
//        }
//        if let userImage = questionModel?.userImage {
//            userImage.loadImage(urlString: userImage)
//        } else {
//            userImage.showUnavailableImage()
//        }
        
    }
    
//    var questionViewModel: QuestionViewModel! {
//        didSet {
//            questionTitleLabel?.text = questionViewModel.title
//            ownerDisplayNameLabel?.text = questionViewModel.displayName
//            if let reputation = questionViewModel.answerAmount {
//                numberAnswersLabel?.text = String(reputation)
//            } else {
//                numberAnswersLabel?.text = ""
//
//            }
//            if let userImage = questionViewModel.userImage {
//                ownerProfileImage.loadImage(urlString: userImage)
//            } else {
//                ownerProfileImage.showUnavailableImage()
//            }
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
