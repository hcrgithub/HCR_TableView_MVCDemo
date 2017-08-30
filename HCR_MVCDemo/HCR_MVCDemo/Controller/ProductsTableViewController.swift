//
//  ProductsTableViewController.swift
//  HCR_MVCDemo
//
//  Created by Hooda on 29/08/17.
//  Copyright © 2017 Hooda. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {

    // MARK: - Data Model
    var productCategories : [ProductCategory] = ProductCategory.getProductCategories()
    var cellIdentifier = "ProductCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Apple Store"
        
        navigationItem.rightBarButtonItem = editButtonItem
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return productCategories.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
        let productCategory = productCategories[section]
        return productCategory.name
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productCategories[section].products.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ProductTableViewCell
        let productCategory = productCategories[indexPath.section]
        let products = productCategory.products
        let product = products[indexPath.row]
        
        cell.product = product
        
        return cell
    }


    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

   
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let productCategory = productCategories[indexPath.section]
            productCategory.products.remove(at: indexPath.row)
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 
  
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

        // get the product you want to move
        let productToMove = productCategories[fromIndexPath.section].products[fromIndexPath.row]
        
        // insert the product at the section
        productCategories[to.section].products.insert(productToMove, at: to.row)
        
        // remove the retrieved product
        productCategories[fromIndexPath.section].products.remove(at: fromIndexPath.row)
    }
 
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }


}
