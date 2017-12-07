//
//  TasksTVCT.swift
//  TrabalhandoComRest
//
//  Created by João Paulo Scopus on 06/12/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import UIKit

class ListTasksTVC: UITableViewController {

    
    lazy var listTask:[TaskRest] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60
        
        TaskService().getTask(onSuccess: { response in
            let result = response?.body?.results ?? []
            self.listTask = result
            self.tableView.reloadData()
        }, onError: { _ in
            print("Xii Deu pau!")
        }, always: {
            
        })
        
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listTask.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCellDetail
        
        let task = self.listTask[indexPath.row]
        
        cell.titleTask.text = task.title
        cell.detailTask.text = task.descriptionTask
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: task.expirateData!)
        cell.timeTask.text = date?.string(with: "h:mm a")
        
        return cell
    }
}

extension ListTasksTVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
