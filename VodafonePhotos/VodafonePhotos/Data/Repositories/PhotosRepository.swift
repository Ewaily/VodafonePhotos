//
//  PhotosRepository.swift
//  VodafonePhotos
//
//  Created by Muhammad Ewaily on 21/07/2021.
//

import Foundation

struct PhotosRepository {
    
    let remoteSource = PhotosAPI()
    private let cacheSource: CachedPhotos = CachedPhotos()
    
    func fetchPhotos(page: Int, limit: Int, completion: @escaping (Result<[Photo], String>) -> Void) {
        remoteSource.fetchPhotos(page: page, limit: limit) { result in
            switch result {
            case .success(let photosListingDTO):
                let photos = photosListingDTO.photos.compactMap( { $0.toDomain()} )
                if photos.count < 25 {
                    self.cacheSource.cachePhotos(photos: photos)
                }
                completion(.success(photos))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchCachedPhotos(completion: @escaping (Result<[Photo], String>) -> Void) {
        if let cachedPhotos = cacheSource.getCachedPhotos() {
            completion(.success(cachedPhotos))
        }
        else {
            completion(.failure("Error"))
        }
    }
}
