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
        setupProgressIndicatior()
    }
    
    private func setupProgressIndicatior() {
        progressIndicatior.color = Colors.GRAY
        progressIndicatior.startAnimating()
    }
}
