//
//  TasksTVCT.swift
//  TrabalhandoComRest
//
//  Created by João Paulo Scopus on 06/12/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import UIKit
import MRProgress

class ListTasksTVC: UITableViewController {

    
    @IBOutlet weak var searchButton: UIBarButtonItem!
    lazy var listTask:[TaskRest] = []
    var filteredTasks = [TaskRest]()
    var update: Bool = false

    var searchActive : Bool = false
    
    @IBAction func showSearchBar(_ sender: Any) {
        showSearchBar(visible: true)
    }
    
    @IBAction func createNewTask(_ sender: Any) {
        
        performSegue(withIdentifier: "newTask", sender: self)
    }
    func showSearchBar(visible: Bool){
        
        if visible {
            let searchBar = UISearchBar()
            searchBar.delegate = self
            searchBar.showsCancelButton = true
            searchBar.showsCancelButton = true
            navigationItem.titleView = searchBar
        }else{
             navigationItem.titleView = nil
        }
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60
        
        fillDataView()
    }
    
    func fillDataView(){
        
        TaskService().getTask(onSuccess: { response in
            let result = response?.body?.results ?? []
            self.listTask = result
            self.tableView.reloadData()
        }, onError: { _ in
            print("Xii Deu pau!")
        }, always: {
            
        })
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
          createButtonAddTask()
        if update {
            fillDataView()
            update = false
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editTask"{
            var taskManager = segue.destination as!  ManagerTaskVC
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedTask = getTaskByIndex(indexPath: indexPath)
                taskManager.selectedTask = selectedTask
            }
        }
    }
    
    func createButtonAddTask(){
        /*
        let testUIBarButtonItem = UIBarButtonItem(image: UIImage(named: "Add"), style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem  = testUIBarButtonItem */
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func deleteTask(id: String, indexPath: IndexPath) {
        
     
        TaskService().delete(taskId: id, onSuccess: { response  in
            print("delete success")
            //Remove a linha selecionada
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }, onError: { error in
            print ("delete fail")
        }, always: {
            
        })
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchActive {
            return self.filteredTasks.count
        }
        return self.listTask.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCellDetail
        
        let task: TaskRest
        
        if searchActive {
            task = self.filteredTasks[indexPath.row]
        }else{
            task = self.listTask[indexPath.row]
        }
        
        cell.titleTask.text = task.title
        cell.detailTask.text = task.descriptionTask
        
        /*let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: task.expirateData!)
        cell.timeTask.text = date?.string(with: "h:mm a") */
        
        cell.timeTask.text = Date().convert(with: task.expirateData!, with: "yyyy-MM-dd").format(with: "h:mm a")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task: TaskRest
            task =  getTaskByIndex(indexPath: indexPath)
            MessageUtil.showConfirm(target: self, title: "Excluir Tarefa", message: "\n\nConfirma Excluir a tarefa: \(task.title!)", positiveButton: "Confirmar", positiveSelector:{ () in
                
                self.deleteTask(id: task.id!, indexPath: indexPath)
                
            }, negativeButton: "Cancelar", negativeHande: { print("cancelar") })
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "editTask", sender: self)
    }
    
    func getTaskByIndex(indexPath: IndexPath) -> TaskRest {
        return  searchActive  ? self.filteredTasks[indexPath.row] :self.listTask[indexPath.row]
    }
}

extension ListTasksTVC: UISearchBarDelegate{
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterContentForSearchText(searchText)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        self.showSearchBar(visible: false)
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive =  false
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All"){
        self.filteredTasks = self.listTask.filter({ ( task: TaskRest ) -> Bool in
            return (task.title?.lowercased().contains(searchText.lowercased()))!
                || (task.descriptionTask?.lowercased().contains(searchText.lowercased()))!
            
        })
        searchActive = self.filteredTasks.count > 0
        self.tableView.reloadData()
    }
    
    
   
}
