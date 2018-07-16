//
//  ServiceError.swift
//  StkOvFlow_iOSChallenge
//
//  Created by Gina De La Rosa on 7/12/18.
//  Copyright © 2018 Gina De La Rosa. All rights reserved.


import Foundation

public enum ServiceError: Error {
    case noInternetConnection
    case decodeFailed
    case fetchFailed
    case other
}
