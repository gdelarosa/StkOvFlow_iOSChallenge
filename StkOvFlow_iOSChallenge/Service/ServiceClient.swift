//
//  ServiceClient.swift
//  StkOvFlow_iOSChallenge
//
//  Created by Gina De La Rosa on 7/12/18.
//  Copyright © 2018 Gina De La Rosa. All rights reserved.
//

import Foundation

struct ServiceClient {

    static let sharedInstance = ServiceClient()

    public func fetchData(urlString: String, completion: @escaping (QuestionResponse, ServiceError?) -> ()) {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, resp, err) in

            if !ServiceReachability.isConnectedToNetwork() {
               print("No internet connection")
            }
            if let err = err {
                print("Failed to fetch data:", err)
            }

            guard let data = data else { return }

            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(QuestionResponse.self, from: data)
                //print(obj)
                completion(response, nil)
            } catch let jsonErr {
                print("Failed to decode json:", jsonErr)
            }
            }.resume()
    }
}

struct AnswerClient {
    
    static let sharedInstance = AnswerClient()
    
    public func fetchData(urlString: String, completion: @escaping (Answer, ServiceError?) -> ()) {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, resp, err) in
            
            if !ServiceReachability.isConnectedToNetwork() {
                print("No internet connection")
            }
            if let err = err {
                print("Failed to fetch data:", err)
            }
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let answerResponse = try decoder.decode(Answer.self, from: data)
                print(answerResponse)
                completion(answerResponse, nil)
            } catch let jsonErr {
                print("Failed to decode json:", jsonErr)
            }
            }.resume()
    }
}

