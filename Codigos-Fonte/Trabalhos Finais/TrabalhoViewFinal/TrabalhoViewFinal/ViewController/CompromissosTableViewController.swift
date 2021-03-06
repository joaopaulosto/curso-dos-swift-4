//
//  CompromissosTableViewController.swift
//  TrabalhoViewFinal
//
//  Created by João Paulo Scopus on 03/12/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import UIKit

final class CompromissosTableViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    lazy var dataTask: [String: [Compromisso]] = [:]
    lazy var originalDataTask: [String: [Compromisso]] = [:]
    
    @IBOutlet weak var fontSize: UISlider!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        GerenciadorCompromisso.sharedInstance.geradorCompromissos(data: Date(), qtde: 2)
       fillData()
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPress(_:)))
        
        let userDefaultConfig = UserDefaults.standard
        self.fontSizeCell = Double(userDefaultConfig.integer(forKey: "fontSize"))
        if self.fontSizeCell == Double(0) {
            self.fontSizeCell = Double(self.fontSize.value)
        }else{
            self.fontSize.value = Float(Double(self.fontSizeCell))
        }
        
        //let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: "longPress:")
        self.view.addGestureRecognizer(longGesture)
        
        let initialMessage = UserDefaults.standard.string(forKey: "welcome")
        
        let alertMessageWelCome =  UIAlertController(title: "Seja Bem vindo", message: initialMessage, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "OK", style: .cancel) { ( _ ) in }
        
        alertMessageWelCome.addAction(cancelAction)
        
        self.present(alertMessageWelCome, animated: true, completion: nil)
       
    }
    
    private func fillData(){
        dataTask = GerenciadorCompromisso.sharedInstance.meusCompromissos()
        originalDataTask = dataTask
    }
    
    var fontSizeCell = 0.0
    @IBAction func sliderValueFontSize(_ sender: Any) {
        self.fontSizeCell = Double(fontSize.value)
        let userDefaultConfig = UserDefaults.standard
        userDefaultConfig.setValue(self.fontSizeCell, forKey: "fontSize")
        userDefaultConfig.synchronize()
        
        tableView.reloadData()
    }
    
    @IBAction func welComeButtom(_ sender: Any) {
        
        let alertMessage =  UIAlertController(title: "Boas Vindas", message: "Informe sua mensagem de Boas Vidas", preferredStyle: .alert)
        
        
        let confirmAction = UIAlertAction(title: "Confirma", style: .default){
            (_) in
            if let field = alertMessage.textFields![0] as? UITextField {
                UserDefaults.standard.setValue(field.text, forKey: "welcome")
                UserDefaults.standard.synchronize()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) { ( _ ) in }
        
        alertMessage.addTextField(configurationHandler: { ( textField ) in textField.placeholder = "Informe sua mensagem de boas vindas" })
        
        alertMessage.addAction(confirmAction)
        alertMessage.addAction(cancelAction)
        
        self.present(alertMessage, animated: true, completion: nil)
    }
}
func testeAlgumaCoisa(any: Any){
    
}

//MARK: Métodos e ações
extension CompromissosTableViewController {
    @IBAction func unwindToTaskList(sender: UIStoryboardSegue) {
        
        if let sourceViewController = sender.source as? AdicionarCompromissoVC, let newTask = sourceViewController.novoCompromisso{
            GerenciadorCompromisso.sharedInstance.adiciona(task: newTask)
            fillData()
            tableView.reloadData()
            
        }
        
    }
}



//MARK: Implementação de UISearchBarDelegate

extension CompromissosTableViewController: UISearchBarDelegate{
    
    //MARK: Serach Bar
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            dataTask = originalDataTask
            tableView.reloadData()
            return
        }
        for (data, tasks) in originalDataTask {
            let filtered = tasks.filter {
                let textToSearch = "\($0.titulo) \($0.descricao)"
                return textToSearch.range(of: searchText) != nil
            }
            dataTask[data] = filtered
        }
        tableView.reloadData()
    }

    
    
}

//MARK: Implementação do TableViewDelegate e DataViewDataSource
extension CompromissosTableViewController {
    func getKeyBySection(_ section: Int) -> String {
        return Array(self.dataTask)[section].key
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return getKeyBySection(section)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataTask.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return (self.dataTask[getKeyBySection(section)]?.count)!
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "compromisso", for: indexPath)
        
        let task = self.dataTask[getKeyBySection(indexPath.section)]?[indexPath.row]
        
        cell.textLabel?.text = task?.titulo
        cell.detailTextLabel?.text = task?.descricao
        
        if task?.situacao == Status.pronto {
            cell.imageView?.image = #imageLiteral(resourceName: "done")
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
        }else{
            cell.accessoryType = UITableViewCellAccessoryType.none
            cell.imageView?.image = #imageLiteral(resourceName: "todo")
        }
        
        
        /*
        let sizeTitle = Double(self.fontSizeCell)
        let fontTitle = UIFont(name: (cell.textLabel?.font.fontName)!, size: CGFloat(sizeTitle))
        cell.textLabel?.font = fontTitle
        
        let sizeDetail = Double(self.fontSizeCell)
        let fontDetail = UIFont(name: (cell.detailTextLabel?.font.fontName)!, size: CGFloat(sizeDetail))
        cell.detailTextLabel?.font = fontDetail
         */
        
       cell.textLabel?.font = cell.textLabel?.font.withSize(CGFloat(self.fontSizeCell))
       cell.detailTextLabel?.font = cell.detailTextLabel?.font.withSize(CGFloat(self.fontSizeCell))
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            //tableView.beginUpdates()
            self.dataTask[getKeyBySection(indexPath.section)]?.remove(at: indexPath.row)
            self.originalDataTask[getKeyBySection(indexPath.section)]?.remove(at: indexPath.row)
            tableView.reloadData()
            //tableView.endUpdates()
            
        }
    }
    
    @objc func longPress(_ longPressGestureRecognizer: UILongPressGestureRecognizer) {
        
        if longPressGestureRecognizer.state == UIGestureRecognizerState.began {
            
            let touchPoint = longPressGestureRecognizer.location(in: self.view)
            if let indexPath = tableView.indexPathForRow(at: touchPoint) {
            let item = self.dataTask[getKeyBySection(indexPath.section)]?[indexPath.row]
                
            item?.situacao = item?.situacao == Status.pronto ? Status.pendente : Status.pronto
            
            tableView.reloadData()
            }
        }
    }
}

