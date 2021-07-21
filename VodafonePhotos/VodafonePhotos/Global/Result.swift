//
//  Result.swift
//  VodafonePhotos
//
//  Created by Muhammad Ewaily on 21/07/2021.
//

import Foundation

enum Result<Value, Error> {
    case success(Value)
    case failure(Error)
}
