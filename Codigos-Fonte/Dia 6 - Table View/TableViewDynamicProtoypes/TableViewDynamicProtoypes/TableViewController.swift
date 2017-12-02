//
//  TableViewController.swift
//  TableViewDynamicProtoypes
//
//  Created by João Paulo Scopus on 29/11/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let imageView = UIImageView(image: #imageLiteral(resourceName: "Back"))
        
        imageView.image? = (imageView.image?.withRenderingMode(.alwaysTemplate))!
        imageView.tintColor = UIColor.magenta
        cell.backgroundColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
        cell.accessoryView = imageView
        cell.textLabel?.text =  "Section \(indexPath.section) Row \(indexPath.row)"

        return cell
    }


    
}
