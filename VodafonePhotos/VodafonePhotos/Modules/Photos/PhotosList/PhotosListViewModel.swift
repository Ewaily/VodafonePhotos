//
//  PhotosListViewModel.swift
//  VodafonePhotos
//
//  Created by Muhammad Ewaily on 21/07/2021.
//

import Foundation

class PhotosListViewModel {
    
    var pageNumber: Int = 1
    let pageLimit: Int = 10
    private let useCase = PhotosListUseCase()
    private var photos: [Photo] = []
    
    func countPhotos() -> Int {
        return photos.count
    }
    
    func fetchPhotos(completion: @escaping () -> Void) {
        useCase.fetchPhotos(page: pageNumber, limit: pageLimit) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let photos):
                self.photos = photos
                print(photos)
                completion()
            case .failure(let error):
                completion()
                print(error)
            }
        }
    }
    
    func getPhotoInfo(at index: Int) -> PhotoCellInfo {
        let photo = photos[index]
        return PhotoCellInfo(photoImageURL: photo.downloadURL)
    }
}
