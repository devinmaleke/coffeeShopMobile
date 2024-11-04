//
//  ProductModel.swift
//  RXSwift_onlineStore
//
//  Created by Samir iOS on 01/11/24.
//

import Foundation

struct ProductModel: Codable {
    let id : Int?
    let title: String?
    let price: Int?
    let description: String?
    let images: [String]?
    let category: CategoryModel?
        
    init(id: Int?, title: String?, price: Int?, description: String?, images: [String]?, category: CategoryModel?) {
        self.id = id
        self.title = title
        self.price = price
        self.description = description
        self.images = images
        self.category = category
    }
}
