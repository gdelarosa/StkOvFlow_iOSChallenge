//
//  ServiceReachability.swift
//  StkOvFlow_iOSChallenge
//
//  Created by Gina De La Rosa on 7/12/18.
//  Copyright © 2018 Gina De La Rosa. All rights reserved.
//  https://stackoverflow.com/questions/30743408/check-for-internet-connection-with-swift

import Foundation
import SystemConfiguration

final class ServiceReachability {
    class func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1, { zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            })
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        
        let isReachable = flags == .reachable
        let needsConnection = flags == .connectionRequired
        
        return isReachable && !needsConnection
    }
}
