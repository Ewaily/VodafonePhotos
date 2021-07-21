//
//  PhotosListingResponseDTO.swift
//  VodafonePhotos
//
//  Created by Muhammad Ewaily on 21/07/2021.
//

import SwiftyJSON

struct PhotosListingResponseDTO {
    var photos    : [PhotosDTO]
    
    init(json: JSON) {
        photos    = json.arrayValue.compactMap( { PhotosDTO(json: $0) } )
        photos.add(.init(id: 0, author: "", width: 0.0, height: 0.0, URL: nil, downloadURL: nil, isAdPlaceholder: true), afterEvery: 5)
    }
}

struct PhotosDTO {
    let id              : Int
    let author          : String
    let width           : Double
    let height          : Double
    let URL             : URL?
    let downloadURL     : URL?
    let isAdPlaceholder : Bool
    
    init(json: JSON) {
        id                  = json[NetworkConstants.Parameters.id].intValue
        author              = json[NetworkConstants.Parameters.author].stringValue
        width               = json[NetworkConstants.Parameters.width].doubleValue
        height              = json[NetworkConstants.Parameters.height].doubleValue
        URL                 = json[NetworkConstants.Parameters.URL].url
        downloadURL         = json[NetworkConstants.Parameters.downloadURL].url
        isAdPlaceholder     = false
    }
    
    init(id: Int, author: String, width: Double, height: Double, URL: URL?, downloadURL: URL?, isAdPlaceholder: Bool) {
        self.id = id
        self.author = author
        self.width = width
        self.height = height
        self.URL = URL
        self.downloadURL = downloadURL
        self.isAdPlaceholder = isAdPlaceholder
    }
    
    func toDomain() -> Photo {
        return Photo(id: id, author: author, width: width, height: height, URL: URL, downloadURL: downloadURL, isAdPlaceholder: isAdPlaceholder, isOfflineCell: false)
    }
}
