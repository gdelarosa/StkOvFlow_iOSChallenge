//
//  Constants.swift
//  StkOvFlow_iOSChallenge
//
//  Created by Gina De La Rosa on 7/12/18.
//  Copyright © 2018 Gina De La Rosa. All rights reserved.
//

import Foundation

var forQuestion: Item?
let questionID = forQuestion?.questionID
let questionListApi = "https://api.stackexchange.com/2.2/search?order=desc&sort=activity&intitle=swift&site=stackoverflow&filter=!9Z(-wwK4f"
let answerApi = "https://api.stackexchange.com/2.2/questions/\(String(describing: questionID))/answers?order=desc&sort=activity&site=stackoverflow&filter=!9Z(-wzftf"
let QuestionTableViewCell = "questionCell"
let AnswerTableViewCell = "answerCell"


