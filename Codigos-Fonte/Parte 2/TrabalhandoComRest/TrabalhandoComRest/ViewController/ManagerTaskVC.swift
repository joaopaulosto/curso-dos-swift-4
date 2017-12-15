//
//  ManagerTaskVC.swift
//  TrabalhandoComRest
//
//  Created by João Paulo Scopus on 06/12/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import UIKit

class ManagerTaskVC: UIViewController {
    
    var selectedTask: TaskRest?
    
    @IBOutlet weak var testeKeyboard: UITextField!
    @IBOutlet weak var titleTask: UITextField!
    @IBOutlet weak var descriptionTask: UITextView!
    @IBOutlet weak var isComplete: UISwitch!
    @IBOutlet weak var dateTimTask: UILabel!
    
    var experationTime = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleTask.becomeFirstResponder()
        
        if self.selectedTask != nil {
            fillTask()
        }else{
            self.dateTimTask.text = Date().format(with: "dd/MM/yyyy h:mm a")
        }
        
    }
    @IBAction func saveTask(_ sender: Any) {
        
        self.view.endEditing(true)
        
        guard  self.titleTask.text != nil || !(self.titleTask.text?.isEmpty)!  else {
            MessageUtil.showMessage(view: self.view, theme: .warning, title: "Atenção", detail: "Informe os Campos corretamente", labelButton: "OK")
            return
        }
        performSaveTask()
        self.navigationController?.popViewController(animated: true)
        let listVC = self.navigationController?.viewControllers.last as! ListTasksTVC
        listVC.update = true
    }
    @IBAction func selectTime(_ sender: Any) {
        createDataPicker()
    }
    func performSaveTask(){
        
        if self.selectedTask == nil {
            self.selectedTask = TaskRest()
        }
        self.selectedTask?.expirateData = self.experationTime.format(with: "yyyy-MM-dd")
        self.selectedTask?.title = self.titleTask.text
        self.selectedTask?.descriptionTask = self.descriptionTask.text
        self.selectedTask?.isComplete = self.isComplete.isOn
        
        
        if self.selectedTask?.id != nil {
            TaskService().update(task: self.selectedTask!, onSuccess: { _ in
                MessageUtil.showMessage(view: self.view, theme: .success, title: "Tarefa", detail: "Tarefa \(self.selectedTask?.title) gravada com sucesso!", labelButton: "OK")
            }, onError: { _ in
                MessageUtil.showMessage(view: self.view, theme: .error, title: "Gravar Trafefa", detail: "Ocorreu um erro ao salvar sua tarefa", labelButton: "Fechar")
            }, always: { })
        }else{
            TaskService().insert(task: self.selectedTask!, onSuccess: { _ in
                MessageUtil.showMessage(view: self.view, theme: .success, title: "Tarefa", detail: "Tarefa \(self.selectedTask?.title) gravada com sucesso!", labelButton: "OK")
            }, onError: { _ in
                MessageUtil.showMessage(view: self.view, theme: .error, title: "Gravar Trafefa", detail: "Ocorreu um erro ao salvar sua tarefa", labelButton: "Fechar")
            }, always: {})
        }        
    }

    func createDataPicker() {
        let alert = UIAlertController(title: nil, message: "\n\n\n\n\n\n\n\n", preferredStyle: .actionSheet)
        
        let viewDatePicker = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200))
        viewDatePicker.backgroundColor = UIColor.clear
        
        
        let pickerFrame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200)
        
        
        let picker = UIDatePicker(frame: pickerFrame)
        if self.dateTimTask.text?.count ?? 0 > 10 {
            picker.date = Date().convert(with: self.dateTimTask.text!, with: "dd/MM/yyyy h:mm a")
        }else{
            picker.date = Date().convert(with: self.dateTimTask.text!, with: Date.FORMAT_SERVER)
        }
        
        
        viewDatePicker.addSubview(picker)
        
        alert.view.addSubview(viewDatePicker)
        
        let formater  = DateFormatter()
        formater.dateFormat = Date.FORMAT_PICKER
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.experationTime = picker.date
            self.dateTimTask.text = self.experationTime.format(with: Date.FORMAT_PICKER)
        })
        
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    /**
     Preenche a tela com a task selecionada
     **/
    func fillTask() {
        self.titleTask.text = self.selectedTask?.title
        self.descriptionTask.text = self.selectedTask?.descriptionTask
        self.isComplete.isOn = self.selectedTask?.isComplete ?? false
        self.experationTime = Date().convert(with: self.selectedTask?.expirateData ?? Date().format(with: Date.FORMAT_SERVER) , with: Date.FORMAT_SERVER)
        self.dateTimTask.text = self.experationTime.format(with: Date.FORMAT_SERVER)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ManagerTaskVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    
    
    
}
