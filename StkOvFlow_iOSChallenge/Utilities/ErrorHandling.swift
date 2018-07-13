//
//  ErrorHandling.swift
//  StkOvFlow_iOSChallenge
//
//  Created by Gina De La Rosa on 7/12/18.
//  Copyright © 2018 Gina De La Rosa. All rights reserved.
//

import Foundation
import UIKit

class ErrorHandling: NSObject {
    
    var homeViewController: HomeTableViewVC?
    
    private func displayErrorAlert(with message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let acceptAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(acceptAction)
        homeViewController?.present(alert, animated: true, completion: nil)
    }
    
    func handleError(_ error: ServiceError) {
        switch error {
        case .noInternetConnection:
            displayErrorAlert(with: "Internet connection is lost")
        case .fetchFailed:
            displayErrorAlert(with: "Failed to fetch data")
        case .decodeFailed:
            displayErrorAlert(with: "Failed to decode json")
        case .other:
            displayErrorAlert(with: "Oops! Something went wrong")
        }
    }    
}
