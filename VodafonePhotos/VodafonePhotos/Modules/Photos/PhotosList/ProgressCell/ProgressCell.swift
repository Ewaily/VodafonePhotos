//
//  ProgressCell.swift
//  VodafonePhotos
//
//  Created by Muhammad Ewaily on 21/07/2021.
//

import UIKit

class ProgressCell: UITableViewCell {
    
    static let ID = String(describing: ProgressCell.self)
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var progressIndicatior: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        selectionStyle = .none
        setupContainerView()
        setupProgressIndicatior()
    }
    
    private func setupContainerView() {
        containerView.borderWidth = Dimensions.APP_BORDER_WIDTH
        containerView.borderColor = Colors.GRAY
    }
    
    private func setupProgressIndicatior() {
        progressIndicatior.color = Colors.GRAY
        progressIndicatior.startAnimating()
    }
}
