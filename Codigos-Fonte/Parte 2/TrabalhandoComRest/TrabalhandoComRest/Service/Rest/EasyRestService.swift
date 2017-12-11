//
//  Route.swift
//  TrabalhandoComRest
//
//  Created by João Paulo Scopus on 06/12/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import Foundation

import  EasyRest



enum TaskRoute: Routable {
    case login (String, String)
    case insert(TaskRest)
    case getTask
    case delete (String)
    case update (TaskRest)
    
    var rule: Rule {
        switch self {
        case let .login(name, password):            
            return Rule(method: .post, path: AppConfig.kServiceAuthenticationURL, isAuthenticable: true, parameters: [.query:  SecurityUtil.shared().createHeadLogin(userName: name, password: password)])
            
         case let .insert(newTask):
            return Rule(method: .post, path: AppConfig.kServiceDefaultURL, isAuthenticable: true, parameters: [ .header : SecurityUtil.shared().getSecurityHeader(),  .body :  newTask ])
            
        case .getTask:
            return Rule(method: .get, path: AppConfig.kServiceDefaultURL, isAuthenticable: true, parameters: [.header: SecurityUtil.shared().getSecurityHeader()])
            
        case let  .delete(taskId):
            return Rule(method: .delete, path: "\(AppConfig.kServiceDefaultURL){id}/", isAuthenticable: true, parameters: [.path: ["id": taskId], .header: SecurityUtil.shared().getSecurityHeader() ])
    
        case let .update (taskUpdate):
            return Rule(method: .put, path: "\(AppConfig.kServiceDefaultURL){id}/", isAuthenticable: false, parameters: [.path: ["id", taskUpdate.id], .header: SecurityUtil.shared().getSecurityHeader(), .body: taskUpdate])
        }
        
    }
}

class TaskService: Service<TaskRoute> {
    
    override var base: String { return AppConfig.kHttpEndpoint }
    

    func login(name: String, password: String, onSuccess: @escaping (Response<Token>?) -> Void, onError: @escaping (RestError?) -> Void, always: @escaping () -> Void) {
        
        try! call(.login(name, password), type: Token.self, onSuccess: onSuccess, onError: onError, always: always)
        
    }
    func insert(task: TaskRest, onSuccess: @escaping (Response<TaskRest>?) -> Void, onError: @escaping (RestError?) -> Void, always: @escaping () -> Void){
        try! call(.insert(task), type: TaskRest.self, onSuccess: onSuccess, onError: onError, always: always)
    }
    
    func getTask(onSuccess: @escaping (Response<TaskParent>?) -> Void, onError: @escaping (RestError?) -> Void, always: @escaping () -> Void){
        try! call(.getTask, type: TaskParent.self, onSuccess: onSuccess, onError: onError, always: always)
    }
    
 
    
    func delete(taskId: String, onSuccess: @escaping (Response<TaskRest>?) -> Void, onError: @escaping (RestError?) -> Void, always: @escaping () -> Void){
        try! call(.delete(taskId), type: TaskRest.self, onSuccess: onSuccess, onError: onError, always: always)
    }
    
    func update(task: TaskRest, onSuccess: @escaping (Response<TaskRest>?) -> Void, onError: @escaping (RestError?) -> Void, always: @escaping () -> Void){
        try! call(.update(task), type: TaskRest.self, onSuccess: onSuccess, onError: onError, always: always)
    }
    
}

    

