//
//  PhotosRepository.swift
//  VodafonePhotos
//
//  Created by Muhammad Ewaily on 21/07/2021.
//

import Foundation

struct PhotosRepository {
    
    let remoteSource = PhotosAPI()
    
    func fetchPhotos(page: Int, limit: Int, completion: @escaping (Result<[Photo], String>) -> Void) {
        remoteSource.fetchPhotos(page: page, limit: limit) { result in
            switch result {
            case .success(let photosListingDTO):
                let recipes = photosListingDTO.photos.compactMap( { $0.toDomain()} )
                completion(.success(recipes))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
