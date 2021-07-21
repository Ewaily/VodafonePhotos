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
        if ObjectiveCReachabilityManager.isReachable() {
            canFetchPhotos = false
            pageNumber = Constants.FIRST_PAGE_NUMBER
            useCase.fetchPhotos(page: pageNumber, limit: pageLimit) { [weak self] result in
                guard let self = self else { return }
                self.canFetchPhotos = true
                switch result {
                case .success(let photos):
                    self.photos = photos
                    print(photos)
                    if self.photos.count < 25 {
                        self.handlePhotosCaching(completion: completion)
                    }
                    else {
                        completion()
                    }
                case .failure(let error):
                    completion()
                    print(error)
                }
            }
        }
        else {
            useCase.fetchCachedPhotos { [weak self] result in
                guard let self = self else { return }
                self.canFetchPhotos = true
                switch result {
                case .success(let photos):
                    self.photos = photos
                    if self.photos.isEmpty {
                        self.addOfflineCell()
                    }
                    print(photos)
                    completion()
                case .failure(let error):
                    if self.photos.isEmpty {
                        self.addOfflineCell()
                    }
                    completion()
                    print(error)
                }
            }
        }
    }
    
    func fetchMorePhotos(completion: @escaping () -> Void) {
        guard canFetchPhotos, ObjectiveCReachabilityManager.isReachable() else { return }
        canFetchPhotos = false
        pageNumber += 1
        useCase.fetchPhotos(page: pageNumber, limit: pageLimit) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let photos):
                self.canFetchPhotos = !photos.isEmpty
                self.photos += photos
                print(photos)
                if self.photos.count < 25 {
                    self.handlePhotosCaching(completion: completion)
                }
                else {
                    completion()
                }
            case .failure(let error):
                completion()
                print(error)
            }
        }
    }
    
    func getPhotoInfo(at index: Int) -> PhotoCellInfo {
        guard !photos.isEmpty else { return .init(photoImageURL: nil) }
        let photo = photos[index]
        return PhotoCellInfo(photoImageURL: photo.downloadURL)
    }
    
    func checkIfAdCellType(at index: Int) -> Bool {
        guard !photos.isEmpty else { return false }
        let photo = photos[index]
        return photo.isAdPlaceholder
    }
    
    func getPhotoDetailsViewInfo(at index: Int) -> PhotoDetailsViewInfo {
        guard !photos.isEmpty else { return .init(authorName: "", photoImageURL: nil) }
        let photo = photos[index]
        return PhotoDetailsViewInfo(authorName: photo.author, photoImageURL: photo.downloadURL)
    }
    
    private func handlePhotosCaching(completion: @escaping () -> Void) {
        useCase.cachePhotos(photos: self.photos, completion: completion)
    }
    
    func refreshPhotos(completion: @escaping () -> Void) {
        if ObjectiveCReachabilityManager.isReachable() {
            photos.removeAll()
            canFetchPhotos = false
            fetchPhotos(completion: completion)
        }
        else {
            completion()
        }
    }
    
    private func addOfflineCell() {
        photos.append(.init(id: 0, author: "", width: 0.0, height: 0.0, URL: nil, downloadURL: nil, isAdPlaceholder: false, isOfflineCell: true))
    }
    
    func checkIfOfflineCellType(at index: Int) -> Bool {
        guard !photos.isEmpty else { return false }
        let photo = photos[index]
        return photo.isOfflineCell
    }
}
