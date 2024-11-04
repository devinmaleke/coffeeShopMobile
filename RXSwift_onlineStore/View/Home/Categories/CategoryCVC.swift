//
//  CollectionCVC.swift
//  RXSwift_onlineStore
//
//  Created by Samir iOS on 01/11/24.
//

import UIKit
import SDWebImage

class CategoryCVC: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = imageView.bounds.width/2
        imageView.clipsToBounds = true
    }
    
    func setup(with image: String?, title: String?) {
        categoryTitle.text = title

        if let imageString = image, let url = URL(string: imageString) {
            imageView.sd_setImage(with: url, placeholderImage: UIImage(named: "SplashScreen"))
        } else {
            imageView.image = UIImage(named: "SplashScreen")
        }
    }
    
}
