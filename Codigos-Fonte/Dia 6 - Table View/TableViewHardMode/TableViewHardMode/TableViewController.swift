//
//  TableViewController.swift
//  TableViewHardMode
//
//  Created by João Paulo Scopus on 29/11/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import UIKit
import DataKit

class TableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let maxSection = 5, maxRows = 15
    lazy var dataIcon: [Int: [Icon]] = [:]
    lazy var dataImage: [Int: [NetworkImage]] = [:]
    
    
    lazy var originalDataIcon: [Int: [Icon]] = [:]
    lazy var originalDataImage: [Int: [NetworkImage]] = [:]

    
    @IBAction func startEditing(_ sender: Any) {
        
        let editing = self.isEditing
        self.setEditing(!editing, animated: !editing)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchBar.delegate = self
        self.dataIcon = generationIcons(maxSection: maxSection, maxRow: maxRows)
        self.dataImage = geradorImagens(maxSections: maxSection, maxRows: maxRows)
        
        self.originalDataIcon = self.dataIcon
        self.originalDataImage = self.dataImage
        
        
        printHelloWord()
    }

    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let iconToMove = dataIcon[sourceIndexPath.section]?[sourceIndexPath.row]
        let imageToMove = dataImage[sourceIndexPath.section]?[sourceIndexPath.row]
        dataIcon[sourceIndexPath.section]?.remove(at:  sourceIndexPath.row)
        dataImage[sourceIndexPath.section]?.remove(at:  sourceIndexPath.row)
        
        dataIcon[destinationIndexPath.section]?.append(iconToMove!)
        dataImage[destinationIndexPath.section]?.append(imageToMove!)
        
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataIcon.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var max = 0
        for (_, list) in (dataIcon) {
            if list.count > max {
                max = list.count
            }
        }
        
        for (_, list) in (dataImage) {
            if list.count > max {
                max = list.count
            }
        }
        return max
        //areturn self.dataIcon[section]?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let iconOrImage = arc4random_uniform(2) == 0
        
        let identity = iconOrImage ? "iconCell" : "imageCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identity, for: indexPath)
        
        if indexPath.row >= (dataIcon[indexPath.section]?.count)! ||
            indexPath.row >= (dataImage[indexPath.section]?.count)! {
            return tableView.dequeueReusableCell(withIdentifier: "placeHolder", for: indexPath)
        }
        
        
        if iconOrImage {
            let content = dataIcon[indexPath.section]![indexPath.row]
            
            cell.textLabel?.text = content.name
            cell.detailTextLabel?.text = content.description
            var img = UIImage(named: content.imageName)
            img = img?.withRenderingMode(.alwaysTemplate)
            cell.imageView?.image = img
            cell.imageView?.tintColor = UIColor(displayP3Red: CGFloat(normalizedRandom()), green: CGFloat(normalizedRandom()), blue: CGFloat(normalizedRandom()), alpha: 1)
        }else{
            let content = dataImage[indexPath.section]![indexPath.row]
            
            cell.textLabel?.text = content.name
            cell.detailTextLabel?.text = content.description
            cell.imageView?.downloadImageAsync(url: URL(string: content.link)!)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            tableView.beginUpdates()
            self.dataIcon[indexPath.section]?.remove(at: indexPath.row)
            self.dataImage[indexPath.section]?.remove(at: indexPath.row)
            tableView.reloadData()
            tableView.endUpdates()
            
        }
    }
    
    //MARK: Serach Bar
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.dataIcon = self.originalDataIcon
            self.dataImage = self.originalDataImage
            tableView.reloadData()
            return
        }
        for (section, list) in originalDataIcon {
            let filtered = list.filter {
                let textToSearch = "\($0.name) \($0.description)"
                return textToSearch.range(of: searchText) != nil
            }
            dataIcon[section] = filtered
        }
        for (section, list) in originalDataImage{
            let filtered = list.filter{
                let textToSearch = "\($0.name) \($0.description)"
                return textToSearch.range(of: searchText) != nil
            }
            dataImage[section] = filtered
        }
        tableView.reloadData()
    }
}
