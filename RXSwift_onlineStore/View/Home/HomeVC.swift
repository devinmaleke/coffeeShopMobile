//
//  HomeVM.swift
//  RXSwift_onlineStore
//
//  Created by Samir iOS on 01/11/24.
//

import UIKit
import RxSwift
import RxCocoa

class HomeVC: UIViewController {
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    @IBOutlet weak var topSellingCollectionView: UICollectionView!
    @IBOutlet weak var newInCollectionView: UICollectionView!
    @IBOutlet weak var profilePictureButton: UIButton!
    @IBOutlet weak var bagICon: UIButton!
    
    private let viewModel = HomeVM()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        viewModel.fetchCategories()
        viewModel.fetchProducts()
        setupBindings()
        setupUI()
        
    }
    
    
    private func setupUI(){
        
        profilePictureButton.layer.cornerRadius = profilePictureButton.frame.size.width / 2
        profilePictureButton.clipsToBounds = true
        profilePictureButton.setImage(UIImage.init(systemName: "person.circle.fill"), for: .normal)
        
        bagICon.layer.cornerRadius = bagICon.frame.size.width / 2
        bagICon.clipsToBounds = true
        bagICon.setImage(UIImage(named: "BagIcon"), for: .normal)
    }
    
    private func setupCollectionView() {
        let categoryCell = UINib(nibName: "CategoryCVC", bundle: nil)
        categoriesCollectionView.register(categoryCell, forCellWithReuseIdentifier: "CategoryCVC")
        
        let topSellingCell = UINib(nibName: "CardCVC", bundle: nil)
        topSellingCollectionView.register(topSellingCell, forCellWithReuseIdentifier: "CardCVC")
    }
    
    private func setupBindings() {
        viewModel.categories
            .bind(to: categoriesCollectionView.rx.items(cellIdentifier: "CategoryCVC", cellType: CategoryCVC.self)) { index, category, cell in
                // Configure your cell
                cell.setup(with: category.image, title: category.name ?? "")
                
            }
            .disposed(by: disposeBag)
        
        
        viewModel.products
            .bind(to: topSellingCollectionView.rx.items(cellIdentifier: "CardCVC", cellType: CardCVC.self)) { index, product, cell in
                // Configure your cell
                cell.setup(with: product.images?[0], title: product.title ?? "TEST", price: product.price ?? 0)
                
            }
            .disposed(by: disposeBag)
        
    }
}

