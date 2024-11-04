//
//  ViewController.swift
//  RXSwift_onlineStore
//
//  Created by Samir iOS on 01/11/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let homeVC = HomeVC()
        navigationController?.pushViewController(homeVC, animated: true)
    }



}

