//
//  PhotosListUseCase.swift
//  VodafonePhotos
//
//  Created by Muhammad Ewaily on 21/07/2021.
//

import Foundation

struct PhotosListUseCase {
    
    private let repository = PhotosRepository()
    
    func fetchPhotos(page: Int, limit: Int, completion: @escaping (Result<[Photo], String>) -> Void) {
        repository.fetchPhotos(page: page, limit: limit, completion: completion)
    }
    
    func cachePhotos(photos: [Photo], completion: @escaping () -> Void) {
        repository.cachePhotos(photos: photos, completion: completion)
    }
    
    func fetchCachedPhotos(completion: @escaping (Result<[Photo], String>) -> Void) {
        repository.fetchCachedPhotos(completion: completion)
    }
}
