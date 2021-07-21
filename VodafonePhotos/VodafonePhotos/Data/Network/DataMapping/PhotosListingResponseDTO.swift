//
//  PhotosListingResponseDTO.swift
//  VodafonePhotos
//
//  Created by Muhammad Ewaily on 21/07/2021.
//

import SwiftyJSON

struct PhotosListingResponseDTO {
    let photos    : [PhotosDTO]
    
    init(json: JSON) {
        photos    = json.arrayValue.compactMap( { PhotosDTO(json: $0) } )
    }
}

struct PhotosDTO {
    let id              : Int
    let author          : String
    let width           : Double
    let height          : Double
    let URL             : URL?
    let downloadURL     : URL?
    
    init(json: JSON) {
        id              = json[NetworkConstants.Parameters.id].intValue
        author          = json[NetworkConstants.Parameters.author].stringValue
        width           = json[NetworkConstants.Parameters.width].doubleValue
        height          = json[NetworkConstants.Parameters.height].doubleValue
        URL             = json[NetworkConstants.Parameters.URL].url
        downloadURL     = json[NetworkConstants.Parameters.downloadURL].url
    }
    
    func toDomain() -> Photo {
        return Photo(id: id, author: author, width: width, height: height, URL: URL, downloadURL: downloadURL)
    }
}
