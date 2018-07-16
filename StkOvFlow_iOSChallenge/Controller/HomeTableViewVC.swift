//
//  HomeTableViewVC.swift
//  StkOvFlow_iOSChallenge
//
//  Created by Gina De La Rosa on 7/12/18.
//  Copyright © 2018 Gina De La Rosa. All rights reserved.
//  Will display questions from the API URL in the Constants folder

import UIKit

class HomeTableViewVC: UITableViewController {
    
    var questionTask: URLSessionDataTask!
    var errorHandling = ErrorHandling()
    var detailsVC: DetailViewController?
    
    var pageIndex: UInt = 0
    let pageSize: UInt = 100
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var questionViewModel: [QuestionViewModel] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestions(pageIndex: pageIndex, pageSize: pageSize)
       
    }
    
    
    @objc private func loadQuestions(pageIndex: UInt, pageSize: UInt) {
        questionTask?.cancel()
        
        activityIndicator.startAnimating()
        
        ServiceClient.sharedInstance.fetchData(urlString: questionListApi, pageIndex: pageIndex, pageSize:pageSize) { [weak self]
            (questionResponse: QuestionResponse?, error: ServiceError?) in
            guard let controller = self else { return }
            
            DispatchQueue.main.async {
                controller.activityIndicator.stopAnimating()
                
                if let questions = questionResponse?.items {
                    controller.questionViewModel = questions.map({ return QuestionViewModel(question: $0)})
                } else if let error = error {
                    controller.errorHandling.handleError(error)
                }
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questionViewModel.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuestionTableViewCell, for: indexPath) as! HomeTableViewCell
        let questionViewModel = self.questionViewModel[indexPath.row]
        cell.questionViewModel = questionViewModel
        
        if (indexPath.row == self.questionViewModel.count - 1) {
            //pageIndex += 1
            self.loadQuestions(pageIndex: pageIndex, pageSize: pageSize)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (detailsVC == nil) {
            detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "details") as? DetailViewController
        }
        detailsVC?.questionModel = self.questionViewModel[indexPath.row]
        self.navigationController?.pushViewController(detailsVC! , animated: true)
    }
    
}
