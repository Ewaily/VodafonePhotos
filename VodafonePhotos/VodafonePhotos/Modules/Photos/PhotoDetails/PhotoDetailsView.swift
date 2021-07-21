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
    
//    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func initialize(with viewModel: PhotoDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    private func setupUI() {
        setupImageView()
        setupScrollView()
        self.navigationItem.title = viewModel.getAuthorName()
        photoImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        photoImageView.sd_setImage(with: viewModel.getPhotoDownloadURL(),
                                    placeholderImage: nil)
    }
    
    private func setupImageView() {
        photoImageView.cornerRadius = 8
        photoImageView.clipsToBounds = true
        photoImageView.contentMode = .scaleAspectFit
        photoImageView.sd_imageTransition = .fade
        photoImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
    }
    
    private func setupScrollView() {
        scrollView.maximumZoomScale = 4
        scrollView.minimumZoomScale = 1
        scrollView.delegate = self
    }
}

// MARK: - UIScrollViewDelegate 

extension PhotoDetailsView: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photoImageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        if scrollView.zoomScale > 1 {
            if let image = photoImageView.image {
                let ratioW = photoImageView.frame.width / image.size.width
                let ratioH = photoImageView.frame.height / image.size.height
                
                let ratio = ratioW < ratioH ? ratioW : ratioH
                let newWidth = image.size.width * ratio
                let newHeight = image.size.height * ratio
                
                let conditionLeft = newWidth * scrollView.zoomScale > photoImageView.frame.width
                let left = 0.5 * (conditionLeft ? newWidth - photoImageView.frame.width : (scrollView.frame.width - scrollView.contentSize.width))
                
                let conditionTop = newHeight * scrollView.zoomScale > photoImageView.frame.height
                let top = 0.5 * (conditionTop ? newHeight - photoImageView.frame.height : (scrollView.frame.height - scrollView.contentSize.height))
                
                scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: top, right: left)
            }
        }
        else {
            scrollView.contentInset = .zero
        }
    }
}
