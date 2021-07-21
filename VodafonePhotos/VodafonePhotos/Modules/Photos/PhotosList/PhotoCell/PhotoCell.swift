//
//  PhotoCell.swift
//  VodafonePhotos
//
//  Created by Muhammad Ewaily on 21/07/2021.
//

import UIKit
import SDWebImage

struct PhotoCellInfo {
    let photoImageURL  : URL?
}

class PhotoCell: UITableViewCell {

    static let ID = String(describing: PhotoCell.self)
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func prepareForReuse() {
        removeImage()
    }
    
    private func setupUI() {
        selectionStyle = .none
        setupContainerView()
        setupImageView()
    }
    
    private func removeImage() {
        photoImageView.sd_cancelCurrentImageLoad()
        photoImageView.image = nil
    }
    
    private func setupContainerView() {
        containerView.borderWidth = Dimensions.APP_BORDER_WIDTH
        containerView.cornerRadius = Dimensions.APP_CORNER_RADIUS
        containerView.borderColor = Colors.GRAY
    }
    
    private func setupImageView() {
        photoImageView.cornerRadius = 8
        photoImageView.clipsToBounds = true
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.sd_imageTransition = .fade
    }
    
    func bindCell(info: PhotoCellInfo) {
        photoImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        photoImageView.sd_setImage(with: info.photoImageURL,
                                    placeholderImage: nil)
    }
}
