//
//  Storyboarded.swift
//  VodafonePhotos
//
//  Created by Muhammad Ewaily on 21/07/2021.
//

import UIKit

protocol Storyboarded: NSObject {

    static func instantiate(storyboard: Storyboards) -> Self
}

extension Storyboarded where Self: UIViewController {

    static func instantiate(storyboard: Storyboards) -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: .main)
        let view = storyboard.instantiateViewController(withIdentifier: id) as? Self
        return view ?? Self()
    }
}
