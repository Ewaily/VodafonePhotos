//
//  Array+Add.swift
//  VodafonePhotos
//
//  Created by Muhammad Ewaily on 21/07/2021.
//

import Foundation

extension Array {
    mutating func add(_ element: Element, afterEvery n: Int) {
        guard n > 0 else { fatalError("afterEvery value must be greater than 0") }
        var index = (self.count / n) * n
        while index > 0 {
            self.insert(element, at: index)
            index -= n
        }
    }
}
