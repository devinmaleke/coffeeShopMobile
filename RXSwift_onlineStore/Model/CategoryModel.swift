//
//  CategoryModel.swift
//  RXSwift_onlineStore
//
//  Created by Samir iOS on 01/11/24.
//

import Foundation

struct CategoryModel: Codable {
    let id : Int?
    let name: String?
    let image: String?
        
    init(id: Int?, name: String?, image: String?) {
        self.id = id
        self.name = name
        self.image = image
    }
}
