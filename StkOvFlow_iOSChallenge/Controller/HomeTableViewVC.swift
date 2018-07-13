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
    
    private func loadQuestions() {
        questionTask?.cancel()
        
        activityIndicator.startAnimating()
        
        ServiceClient.sharedInstance.fetchData(urlString: Constants.stackExchangeApi) { [weak self]
            (questionResponse: QuestionResponse?, error: ServiceError?) in
            guard let controller = self else { return }
            
            DispatchQueue.main.async {
                controller.activityIndicator.stopAnimating()
                
                if let questions = questionResponse?.details {
                    controller.questionViewModel = questions.map({ return QuestionViewModel(question: $0)})
                } else if let error = error {
                    controller.errorHandling.handleError(error)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questionViewModel.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CELL, for: indexPath) as! HomeTableViewCell
        let questionViewModel = self.questionViewModel[indexPath.row]
        cell.questionViewModel = questionViewModel
        
        return cell
    }
 
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
  
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
//    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        let detailViewController = DetailViewController()
//        navigationController?.pushViewController(detailViewController, animated: true)
//    }
 

}
