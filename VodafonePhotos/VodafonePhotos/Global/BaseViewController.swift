//
//  BaseViewController.swift
//  VodafonePhotos
//
//  Created by Muhammad Ewaily on 21/07/2021.
//

import UIKit

class BaseViewController: UIViewController, Storyboarded {

    override func viewDidLoad() {
        super.viewDidLoad()
        styleNavigationBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func styleNavigationBar() {
        let attributes: [NSAttributedString.Key : Any] = [.foregroundColor: Colors.DARK_SHADE ?? .black ,
                                                          .font : Fonts.TITLE_FONT]

        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = Colors.DARK_SHADE
        navigationController?.navigationBar.titleTextAttributes = attributes
        navigationController?.navigationBar.setBackgroundImage(UIImage(),
                                                               for: UIBarPosition.any,
                                                               barMetrics: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
}
