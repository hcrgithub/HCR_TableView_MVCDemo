//
//  ProductTableViewCell.swift
//  HCR_MVCDemo
//
//  Created by Hooda on 29/08/17.
//  Copyright © 2017 Hooda. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    
    @IBOutlet var imgViewProduct: UIImageView!
    @IBOutlet var lblProductTitle: UILabel!
    @IBOutlet var lblProductDescription: UILabel!

    // MARK: - Data Model
    
    var product: Product? {
        
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        imgViewProduct?.image = product?.image
        lblProductTitle?.text = product?.title
        lblProductDescription?.text = product?.description
    }
}
