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
    
    private let viewModel = CategoryVM()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        viewModel.fetchCategories()
        
            
       
    }

    
    private func setupCollectionView() {
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        let categoryCell = UINib(nibName: "PickerCVC", bundle: nil)
        categoriesCollectionView.register(categoryCell, forCellWithReuseIdentifier: "CategoryCVC")
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == pickerCollectionView{
            return filterSelection.count
        }else{
            return 20
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == pickerCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PickerCVC", for: indexPath) as! PickerCVC
            cell.setup(title: filterSelection[indexPath.row])
            cell.setSelected(indexPath.row == filterIndex)
            return cell
        } else {
            let cardCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCVC", for: indexPath) as! CardCVC
            return cardCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        filterIndex = indexPath.row
        
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            // Ambil lebar koleksi
        if collectionView == cardCollectionView{
            let totalWidth = collectionView.frame.width
            let padding: CGFloat = 16 // atau nilai padding yang Anda inginkan
            let availableWidth = totalWidth - padding * 3 // Kurangi padding untuk kolom dan ruang antar sel
            
            // Hitung lebar setiap sel (dibagi dua)
            let width = availableWidth / 2
            
            // Tentukan tinggi yang diinginkan
            let height: CGFloat = 240 // Ganti dengan tinggi yang Anda inginkan
            
            return CGSize(width: width, height: height)
        }else{
            return CGSize(width: 128, height: 29)
        }
            
        }
        
        // Mengatur jarak antar item
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 16 // Jarak antara baris
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 16 // Jarak antar kolom
        }
    
}
