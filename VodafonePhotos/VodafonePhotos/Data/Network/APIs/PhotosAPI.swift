//
//  PhotosAPI.swift
//  VodafonePhotos
//
//  Created by Muhammad Ewaily on 21/07/2021.
//

import Alamofire
import SwiftyJSON

struct PhotosAPI: BaseAPI {
    
    func fetchPhotos(page: Int, limit: Int,
                       completion: @escaping (Result<PhotosListingResponseDTO, String>) -> Void) {
        request(request: PhotosRouter.list(page: page, limit: limit)) { result in
            switch result {
            case .success(let json):
                let fetchResults = PhotosListingResponseDTO(json: json)
                completion(.success(fetchResults))
            case .failure(let error):
                completion(.failure(error.localizedDescription))
            }
        }
        
    }
}
