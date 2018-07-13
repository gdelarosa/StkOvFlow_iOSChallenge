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
    
    public func fetchData<T: Decodable>(urlString: String, completion: @escaping (T?, ServiceError?) ->()) {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, resp, err) in
            
            if !ServiceReachability.isConnectedToNetwork() {
                completion(nil, .noInternetConnection)
            }
            if let err = err {
                print("Failed to fetch data:", err)
                completion(nil, .fetchFailed)
            }
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let obj = try decoder.decode(T.self, from: data)
                completion(obj, nil)
            } catch let jsonErr {
                print("Failed to decode json:", jsonErr)
                completion(nil, .decodeFailed)
            }
            }.resume()
    }
}
