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
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
    }
    
    func setup(with imageUrl: URL?, title: String) {
        categoryTitle.text = title
        
        if let url = imageUrl {
            imageView.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"))
        } else {
            imageView.image = UIImage(named: "placeholder")
        }
    }
     
}
