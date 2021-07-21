//
//  PhotoDetailsView.swift
//  VodafonePhotos
//
//  Created by Muhammad Ewaily on 21/07/2021.
//

import UIKit
import SDWebImage

class PhotoDetailsView: BaseViewController {
    
    private var viewModel: PhotoDetailsViewModel!
    
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func initialize(with viewModel: PhotoDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    private func setupUI() {
        setupImageView()
        authorNameLabel.text = viewModel.getAuthorName()
        photoImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        photoImageView.sd_setImage(with: viewModel.getPhotoDownloadURL(),
                                    placeholderImage: nil)
    }
    
    private func setupImageView() {
        photoImageView.cornerRadius = 8
        photoImageView.clipsToBounds = true
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.sd_imageTransition = .fade
        photoImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
    }
}
