//
//  AnswerViewModel.swift
//  StkOvFlow_iOSChallenge
//
//  Created by Gina De La Rosa on 7/15/18.
//  Copyright © 2018 Gina De La Rosa. All rights reserved.
//

import Foundation

struct AnswerViewModel {
    
    var answerBody: String?
    var displayName: String?
    var userImage: String?
   
    init(answer: AnswerItem) {
        answerBody = answer.bodyMarkdown
        displayName = answer.answerOwner.displayName
        userImage =  answer.answerOwner.profileImage
    }
}
