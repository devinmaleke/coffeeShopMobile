//
//  CardCVC.swift
//  RXSwift_onlineStore
//
//  Created by Samir iOS on 01/11/24.
//

import UIKit

class CardCVC: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 8
        
    }
    
    func setup(with image: String?, title: String, price: Int) {
        titleLabel.text = title
        priceLabel.text = "Rp. \(price)"
        
        
        if let imageString = image, let url = URL(string: imageString) {
            imageView.sd_setImage(with: url, placeholderImage: UIImage(named: "SplashScreen"))
        } else {
            imageView.image = UIImage(named: "SplashScreen")
        }
        
    }
    
    

}
