//
//  ReachabilityManager.swift
//  VodafonePhotos
//
//  Created by Muhammad Ewaily on 21/07/2021.
//

import Alamofire

@objc class ReachabilityManager: NSObject {
    
    @objc static func isReachable() -> Bool {
        let status = NetworkReachabilityManager()?.isReachable ?? false
        return status
    }
}
