//
//  TaskManager.swift
//  TrabalhandoComRest
//
//  Created by João Paulo Scopus on 06/12/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import Foundation

public class TaskManager{
    
    public func getTasks() -> [Task]{
        var listTasks = [Task]()
        listTasks.append(Task(id: "", expirate_data: Date(), title: "Atividade 1", description: "Atividade para fins de testes 1", is_complete: false, owner: ""))
        
        listTasks.append(Task(id: "", expirate_data: Date(), title: "Atividade 2", description: "Atividade para fins de testes 1", is_complete: false, owner: ""))
        
        listTasks.append(Task(id: "", expirate_data: Date(), title: "Atividade 3", description: "Atividade para fins de testes 1", is_complete: false, owner: ""))
        
        
        listTasks.append(Task(id: "", expirate_data: Date(), title: "Atividade 4", description: "Atividade para fins de testes 1", is_complete: false, owner: ""))
        
        listTasks.append(Task(id: "", expirate_data: Date(), title: "Atividade 5", description: "Atividade para fins de testes 1", is_complete: false, owner: ""))
        
        return listTasks
    }
}
