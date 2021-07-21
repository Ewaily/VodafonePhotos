//
//  Photo.swift
//  VodafonePhotos
//
//  Created by Muhammad Ewaily on 21/07/2021.
//

import Foundation

struct Photo {
    let id              : Int
    let author          : String
    let width           : Double
    let height          : Double
    let URL             : URL?
    let downloadURL     : URL?
    let isAdPlaceholder : Bool
}
