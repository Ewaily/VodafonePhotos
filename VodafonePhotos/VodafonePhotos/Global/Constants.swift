//
//  Constants.swift
//  VodafonePhotos
//
//  Created by Muhammad Ewaily on 21/07/2021.
//

import UIKit

struct Constants {
    
}

enum Storyboards : String {
    case MAIN       = "Main"
    case PHOTOS     = "Photos"
}

struct Fonts {

    static let TITLE_FONT = Fonts.getFont(style: .Semibold, size: 20)

    enum Style: String {
        case Regular
        case Medium
        case Light
        case Bold
        case Semibold
    }
    
    static func getFont(style: Style, size: CGFloat) -> UIFont {
        return UIFont(name: "SFUIText-\(style.rawValue)", size: size) ?? .systemFont(ofSize: size)
    }
}

struct Colors {
    static let PRIMARY_COLOR = UIColor(named: "PrimaryColor")
    static let ACCENT_COLOR = UIColor(named: "AccentColor")
    static let DARK_SHADE = UIColor(named: "DarkShade")
    static let GRAY = UIColor(named: "Gray")
    static let WHITE = UIColor(named: "White")
}

struct Dimensions {
    
    static let APP_CORNER_RADIUS : CGFloat = 4
    static let APP_BORDER_WIDTH : CGFloat = 0.3
}

struct Images {
    static let NO_INTERNET_IMAGE = UIImage(named: "wifi_image")
    static let NO_SEARCH_RESULTS = UIImage(named: "search_image")
}
