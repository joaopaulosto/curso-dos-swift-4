//
//  TableViewController.swift
//  TableViewHardMode
//
//  Created by João Paulo Scopus on 29/11/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import UIKit
import DataKit

class TableViewController: UITableViewController {
    
    let maxSection = 5, maxRows = 15
    lazy var dataIcon: [Int: [Icon]] = [:]
    lazy var dataImage: [Int: [NetworkImage]] = [:]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataIcon = generationIcons(maxSection: maxSection, maxRow: maxRows)
        self.dataImage = geradorImagens(maxSections: maxSection, maxRows: maxRows)
        printHelloWord()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataIcon.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataIcon[section]?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let par = indexPath.row % 2 == 0
        
        let identity = par ? "iconCell" : "imageCell"
    
        let cell = tableView.dequeueReusableCell(withIdentifier: identity, for: indexPath)
      
        if par {
            guard let contentIcon = self.dataIcon[indexPath.section]?[indexPath.row]  else {
                return tableView.dequeueReusableCell(withIdentifier: "placeHolder", for: indexPath)
            }
            
            cell.imageView?.image = UIImage(named: contentIcon.imageName)
            cell.detailTextLabel?.text = contentIcon.description
            cell.textLabel?.text = contentIcon.name
            
            let red = CGFloat(normalizedRandom())
            let green = CGFloat(normalizedRandom())
            let blue = CGFloat(normalizedRandom())
            let alpha = CGFloat(1.0)
            cell.imageView?.image = ( cell.imageView?.image?.withRenderingMode(.alwaysTemplate))!
            cell.imageView?.tintColor = UIColor(displayP3Red: red, green: green, blue: blue, alpha: alpha)
            
            
        }else{
            guard let contentImage = self.dataImage[indexPath.section]?[indexPath.row]  else {
                return tableView.dequeueReusableCell(withIdentifier: "placeHolder", for: indexPath)
            }
            
            cell.detailTextLabel?.text = contentImage.description
            cell.textLabel?.text = contentImage.name
            //cell.imageView?.downloadImage(url: URL(string: contentImage.link)!)
            cell.imageView?.downloadImageAsync(url: URL(string: contentImage.link)!)
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            
            
        }
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
