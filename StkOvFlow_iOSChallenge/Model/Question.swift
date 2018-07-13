//
//  Question.swift
//  StkOvFlow_iOSChallenge
//
//  Created by Gina De La Rosa on 7/12/18.
//  Copyright © 2018 Gina De La Rosa. All rights reserved.
//

import Foundation

struct Question: Decodable {
    let title: String?
    let displayName: String?
    let profileImage: String?
    let reputation: Int?
}

struct QuestionResponse: Decodable {
    let details: [Question]
}
