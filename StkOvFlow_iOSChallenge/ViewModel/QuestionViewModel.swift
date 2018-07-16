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
    var questionID: Int?
    var answerBodyMarkdown: String?
    
        //Dependency Injection
        init(question: Item) {
            title = question.title
            displayName = question.owner.displayName
            answerAmount = question.answerCount
            userImage = question.owner.profileImage
            questionID = question.questionID
            answerBodyMarkdown = question.bodyMarkdown
        }
}



