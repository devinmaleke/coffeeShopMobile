//
//  CategoryVM.swift
//  RXSwift_onlineStore
//
//  Created by Samir iOS on 01/11/24.
//

import Foundation
import RxSwift
import RxCocoa

class HomeVM {
    private let disposeBag = DisposeBag()
    
    // Observable untuk menyimpan data pengguna
    var categories: BehaviorRelay<[CategoryModel]> = BehaviorRelay(value: [])
    var products: BehaviorRelay<[ProductModel]> = BehaviorRelay(value: [])
    
    func fetchCategories() {
        let url = URL(string: "https://api.escuelajs.co/api/v1/categories")!
        
        URLSession.shared.rx.data(request: URLRequest(url: url))
            .map { data -> [CategoryModel] in
                let categoryResponse = try JSONDecoder().decode([CategoryModel].self, from: data)
                return categoryResponse
            }
            .bind(to: categories)
            .disposed(by: disposeBag)
    }
    
    func fetchProducts() {
        let url = URL(string: "https://api.escuelajs.co/api/v1/products")!
        
        URLSession.shared.rx.data(request: URLRequest(url: url))
            .map { data -> [ProductModel] in
                let productResponse = try JSONDecoder().decode([ProductModel].self, from: data)
                return productResponse
            }
            .bind(to: products)
            .disposed(by: disposeBag)
    }
}

