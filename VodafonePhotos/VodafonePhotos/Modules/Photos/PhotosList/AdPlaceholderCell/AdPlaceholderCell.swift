//
//  AdPlaceholderCell.swift
//  VodafonePhotos
//
//  Created by Muhammad Ewaily on 21/07/2021.
//

import UIKit

class AdPlaceholderCell: UITableViewCell {

    static let ID = String(describing: AdPlaceholderCell.self)
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        selectionStyle = .none
        setupContainerView()
        setupImageView()
    }
    
    private func setupContainerView() {
        containerView.cornerRadius = Dimensions.APP_CORNER_RADIUS
    }
    
    private func setupImageView() {
        photoImageView.cornerRadius = 8
        photoImageView.clipsToBounds = true
        photoImageView.contentMode = .scaleAspectFit
        photoImageView.image = Images.AD_PLACEHOLDER
    }
}
