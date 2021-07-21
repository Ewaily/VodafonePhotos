//
//  PhotosListView.swift
//  VodafonePhotos
//
//  Created by Muhammad Ewaily on 21/07/2021.
//

import UIKit

class PhotosListView: BaseViewController {
    
    private var viewModel: PhotosListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = PhotosListViewModel()
        viewModel.fetchPhotos {
            
        }
    }
}
