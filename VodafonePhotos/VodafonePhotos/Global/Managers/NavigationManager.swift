//
//  NavigationManager.swift
//  VodafonePhotos
//
//  Created by Muhammad Ewaily on 21/07/2021.
//

import UIKit

struct NavigationManager {
    
    let navigationController: UINavigationController
    
    func openPhotoDetails(photoDetailsViewInfo: PhotoDetailsViewInfo) {
        let photoDetailsView = PhotoDetailsView.instantiate(storyboard: .PHOTOS)
        let viewModel = PhotoDetailsViewModel(photoDetailsViewInfo: photoDetailsViewInfo)
        photoDetailsView.initialize(with: viewModel)
        navigationController.pushViewController(photoDetailsView, animated: true)
    }
}
