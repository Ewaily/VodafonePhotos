//
//  CachedPhotos.swift
//  VodafonePhotos
//
//  Created by Muhammad Ewaily on 21/07/2021.
//

import Foundation
import UIKit

struct CachedPhotos {
    private let cachedPhotos = "cached_photos"
    private let userDefault = UserDefaults.standard
    
    func cachePhotos(photos: [Photo]) {
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
            let data = try encoder.encode(photos)

            // Write/Set Data
            userDefault.set(data, forKey: cachedPhotos)

        } catch {
            print("Unable to Encode Note (\(error))")
        }
    }
    
    func getCachedPhotos() -> [Photo]? {
        if let data = userDefault.data(forKey: cachedPhotos) {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                let photos = try decoder.decode([Photo].self, from: data)
                
                return photos
                
            } catch {
                print("Unable to Decode Notes (\(error))")
                return nil
            }
        }
        else {
            return nil
        }
    }
    
//    private func getPhotosWithDownloadedImages(photos: [Photo]) -> [Photo] {
//        var tempPhotos = photos
//        DispatchQueue.global(qos: .background).async {
//            for index in 0...photos.count - 1 {
//                do
//                 {
//                    if let url = tempPhotos[index].downloadURL {
//                        if let data = try? Data(contentsOf: url)
//                        {
//                            DispatchQueue.main.async {
//                                tempPhotos[index].image = data
//                            }
//                        }
//                    }
//                    else {
//                        tempPhotos[index].image  = Data()
//                    }
//
//                 }
//                catch {
//                       print("")
//                      }
//            }
//
//         }
//        return tempPhotos
//    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
