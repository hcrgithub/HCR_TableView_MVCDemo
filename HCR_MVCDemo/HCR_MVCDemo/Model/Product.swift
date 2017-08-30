//
//  Product.swift
//  HCR_MVCDemo
//
//  Created by Hooda on 29/08/17.
//  Copyright © 2017 Hooda. All rights reserved.
//

/*
 Info : This is a model representing the Product metadata
 Usage : Will be used as an object in ProductCategory
*/

import UIKit

enum ProductRating {
    case bad
    case average
    case good
}


class Product {
    
    var image : UIImage
    var title : String
    var description : String
    var rating : ProductRating

    init(title : String, description : String, imageName : String) {
        
        self.title = title
        self.description = description
        
        if let image = UIImage(named: imageName) {
            self.image = image
        } else {
            self.image = UIImage(named: "default")!
        }
        
        rating = .good
    }
}







