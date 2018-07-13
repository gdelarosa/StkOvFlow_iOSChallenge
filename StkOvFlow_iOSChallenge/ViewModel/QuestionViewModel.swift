//
//  QuestionViewModel.swift
//  StkOvFlow_iOSChallenge
//
//  Created by Gina De La Rosa on 7/12/18.
//  Copyright © 2018 Gina De La Rosa. All rights reserved.
//

import Foundation

struct QuestionViewModel {
    
    var title: String?
    var displayName: String?
    var userImage: String?
    var answerAmount: Int?
    
    //Dependency Injection
    init(question: Question) {
        title = question.title
        displayName = question.displayName
        answerAmount = question.reputation
        
        if let userImagePath = question.profileImage {
            userImage = Constants.userImagePrefix + userImagePath
        } else {
            userImage = nil
        }
        
    }
}
