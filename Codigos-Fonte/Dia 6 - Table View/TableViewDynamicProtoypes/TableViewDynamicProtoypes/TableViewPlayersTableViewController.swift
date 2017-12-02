//
//  TableViewPlayersTableViewController.swift
//  TableViewDynamicProtoypes
//
//  Created by João Paulo Scopus on 29/11/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import UIKit

class TableViewPlayersTableViewController: UITableViewController {

    @IBOutlet var myTable: UITableView!
    var listaJogadores: [Hi🕹Score] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //myTable.register(UINib(nibName: "CustomTableViewCell"), Bundle: nil),
        
        myTable.register(UINib(nibName: "CustomCell2", bundle: nil), forCellReuseIdentifier: "cellReuseIdentity")
        
        
        listaJogadores = Hi🕹Score.criarListaScore(qtde: 10)
    
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
        // #warning Incomplete implementation, return the number of rows
        return listaJogadores.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "player", for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentity", for: indexPath)
        
        let custom = cell as! CustomCell2

        let player = listaJogadores[indexPath.row]
        //cell.detailTextLabel?.text =  String(player.🏅)
        //cell.textLabel?.text = player.nome
        custom.detailCell.text = String(player.🏅)
        custom.titleCell.text = player.nome

        return custom
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
