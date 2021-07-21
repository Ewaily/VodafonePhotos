//
//  PhotosListViewModel.swift
//  VodafonePhotos
//
//  Created by Muhammad Ewaily on 21/07/2021.
//

import Foundation

class PhotosListViewModel {
    
    private var pageNumber: Int = 1
    private let pageLimit: Int = Constants.DEFAULT_PAGE_LIMIT
    private let useCase = PhotosListUseCase()
    private var photos: [Photo] = []
    var canFetchPhotos: Bool = true
    
    func countPhotos() -> Int {
        return photos.count
    }
    
    func fetchPhotos(completion: @escaping () -> Void) {
        canFetchPhotos = false
        pageNumber = Constants.FIRST_PAGE_NUMBER
        useCase.fetchPhotos(page: pageNumber, limit: pageLimit) { [weak self] result in
            guard let self = self else { return }
            self.canFetchPhotos = true
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
    
    func fetchMorePhotos(completion: @escaping () -> Void) {
        guard canFetchPhotos else { return }
        canFetchPhotos = false
        pageNumber += 1
        useCase.fetchPhotos(page: pageNumber, limit: pageLimit) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let photos):
                self.canFetchPhotos = !photos.isEmpty
                self.photos += photos
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
    
    func checkIfAdCellType(at index: Int) -> Bool {
        let photo = photos[index]
        return photo.isAdPlaceholder
    }
}
