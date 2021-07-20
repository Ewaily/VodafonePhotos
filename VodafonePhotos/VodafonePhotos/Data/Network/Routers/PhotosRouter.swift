//
//  PhotosRouter.swift
//  VodafonePhotos
//
//  Created by Muhammad Ewaily on 21/07/2021.
//

import Foundation
import Alamofire

enum PhotosRouter: BaseRouter {
    
    case list(page: Int, limit: Int)
    
    var method: HTTPMethod {
        switch self {
        case .list:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .list:
            return NetworkConstants.Path.list
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return nil
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .list(let page, let limit):
            return [
                NetworkConstants.Parameters.page : page,
                NetworkConstants.Parameters.limit : limit
            ]
        }
    }
    
    
}
