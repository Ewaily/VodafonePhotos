//
//  OfflineCell.swift
//  VodafonePhotos
//
//  Created by Muhammad Ewaily on 21/07/2021.
//

import UIKit

class OfflineCell: UITableViewCell {
    
    static let ID = String(describing: OfflineCell.self)
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        selectionStyle = .none
        setupImageView()
    }
    
    private func setupImageView() {
        photoImageView.contentMode = .scaleAspectFit
        photoImageView.image = Images.NO_INTERNET_CONNECTION
    }
}
