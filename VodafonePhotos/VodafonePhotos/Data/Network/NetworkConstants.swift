//
//  NetworkConstants.swift
//  VodafonePhotos
//
//  Created by Muhammad Ewaily on 21/07/2021.
//

import Foundation

struct NetworkConstants {
    
    static let BASE_URL = "https://picsum.photos/v2/"
    
    enum ContentType: String {
        case json = "application/json"
    }
    
    struct HTTPHeader {
        static let content_type  = "Content-Type"
        static let acceptType    = "Accept"
    }
    
    struct  Path {
        static let list   = "list"
    }
    
    struct Parameters {
        static let page               = "page"
        static let limit              = "limit"
        static let id                 = "id"
        static let author             = "author"
        static let width              = "width"
        static let height             = "height"
        static let URL                = "url"
        static let downloadURL        = "download_url"
    }
}
