//
//  Answer.swift
//  StkOvFlow_iOSChallenge
//
//  Created by Gina De La Rosa on 7/15/18.
//  Copyright © 2018 Gina De La Rosa. All rights reserved.
//

import Foundation

// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

struct Answer: Codable {
    let items: [Item]
    let hasMore: Bool
    let quotaMax, quotaRemaining: Int
    
    enum CodingKeys: String, CodingKey {
        case items
        case hasMore = "has_more"
        case quotaMax = "quota_max"
        case quotaRemaining = "quota_remaining"
    }
}

struct AnswerItem: Codable {
    let owner: AnswerOwner
    let isAccepted: Bool
    let score, lastActivityDate: Int
    let lastEditDate: Int?
    let creationDate, answerID, questionID: Int
    
    enum CodingKeys: String, CodingKey {
        case owner
        case isAccepted = "is_accepted"
        case score
        case lastActivityDate = "last_activity_date"
        case lastEditDate = "last_edit_date"
        case creationDate = "creation_date"
        case answerID = "answer_id"
        case questionID = "question_id"
    }
}

struct AnswerOwner: Codable {
    let reputation, userID: Int
    let userType: String
    let acceptRate: Int?
    let profileImage, displayName, link: String
    
    enum CodingKeys: String, CodingKey {
        case reputation
        case userID = "user_id"
        case userType = "user_type"
        case acceptRate = "accept_rate"
        case profileImage = "profile_image"
        case displayName = "display_name"
        case link
    }
}
