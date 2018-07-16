//
//  DetailViewController.swift
//  StkOvFlow_iOSChallenge
//
//  Created by Gina De La Rosa on 7/12/18.
//  Copyright © 2018 Gina De La Rosa. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    var questionModel:QuestionViewModel?
    var questionTask: URLSessionDataTask!
    var errorHandling = ErrorHandling()
    //var questionID: String?
    
    
    @IBOutlet weak var detailQuestionTitleLabel: UILabel!
    @IBOutlet weak var detailOwnerDisplayNameLabel: UILabel!
    @IBOutlet weak var detailNumberAnswersLabel: UILabel!
    @IBOutlet weak var detailOwnerProfileImage: UIImageView!
    @IBOutlet weak var detailAnswerBody: UILabel!
    @IBOutlet weak var detailBodyQuestion: UILabel!
    @IBOutlet weak var answersTableView: UITableView!
    
    var answerViewModel: [AnswerViewModel] = [] {
        didSet {
            self.answersTableView.reloadData()
        }
    }
    
    @objc private func loadAnswers() {
        questionTask?.cancel()
        
        
        AnswerClient.sharedInstance.fetchData(urlString: Constants.answerApi) { [weak self]
            (answerResponse: Answer?, error: ServiceError?) in
            guard let controller = self else { return }
            
//            DispatchQueue.main.async {
//
//                if let answers = answerResponse?.items {
//                    controller.answerViewModel = answers.map({ return AnswerViewModel(answer: $0)})
//                } else if let error = error {
//                    controller.errorHandling.handleError(error)
//                }
//            }
        }
    }
    
        override func viewDidAppear(_ animated: Bool) {
            detailQuestionTitleLabel.text = questionModel?.title
            detailOwnerDisplayNameLabel.text = questionModel?.displayName
            detailAnswerBody.text = questionModel?.answerBodyMarkdown
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
            loadAnswers()
        }
    
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
    
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.AnswerTableViewCell, for: indexPath) as! AnswersTableViewCell
//        let answerViewModel = self.answerViewModel[indexPath.row]
//        cell.answerViewModel = answerViewModel
        
        return cell
    }


    
    

}
