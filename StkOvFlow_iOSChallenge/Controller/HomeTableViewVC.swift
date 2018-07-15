//
//  HomeTableViewVC.swift
//  StkOvFlow_iOSChallenge
//
//  Created by Gina De La Rosa on 7/12/18.
//  Copyright © 2018 Gina De La Rosa. All rights reserved.
//

import UIKit

class HomeTableViewVC: UITableViewController {
    
    var questionTask: URLSessionDataTask!
    var errorHandling = ErrorHandling()
    
    var detailsVC: DetailViewController?
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    var questionViewModel: [QuestionViewModel] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestions()
    }
    
    @objc private func loadQuestions() {
        questionTask?.cancel()
        
        activityIndicator.startAnimating()
        
        ServiceClient.sharedInstance.fetchData(urlString: Constants.stackExchangeApi) { [weak self]
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
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCell, for: indexPath) as! HomeTableViewCell
        let questionViewModel = self.questionViewModel[indexPath.row]
        cell.questionViewModel = questionViewModel
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (detailsVC == nil) {
            detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "details") as? DetailViewController
        }
        detailsVC?.questionModel = self.questionViewModel[indexPath.row] //item if not row
        self.navigationController?.pushViewController(detailsVC! , animated: true)
    }
    
}
