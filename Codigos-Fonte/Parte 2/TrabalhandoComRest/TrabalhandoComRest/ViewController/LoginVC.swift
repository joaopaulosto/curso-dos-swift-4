//
//  LoginVC.swift
//  TrabalhandoComRest
//
//  Created by João Paulo Scopus on 06/12/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        self.verifyLastLogin()
    }
    
    func verifyLastLogin(){
        let db = DataBase()
        if let token = db.findById(id: "1"){
            let expiratedDate = Date(timeIntervalSinceNow: TimeInterval(token.expiresIn))
            if Date() < expiratedDate {
                SecurityUtil.shared().settingKeyLogin(key: token.accessToken!)
                self.performSegue(withIdentifier: "loginSuccess", sender: self)
            }
        }else{
            self.userName.text = UserDefaults.standard.string(forKey: "username")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(_ sender: Any) {
        if validateField() {
            performLogin()
        }
    }
    func performLogin() {
        
        TaskService().login(name: (self.userName?.text!)!, password: (self.password?.text!)!, onSuccess: { response in
            if let token = response?.body {
                self.performLoginSuccess(token: token)
            }
            
        }, onError: { _ in
            print("Ops! Ocorreu um erro")
        }, always: {
            print("finalizei a execução")
        })
    }
    func performLoginSuccess(token: Token) {
        
        let db = DataBase()
 
        let enty = TokenEnty()
        enty.id = "1"
        enty.accessToken = token.accessToken
        enty.expiresIn = token.expiresIn!
        enty.refreshToken = token.refreshToken
        enty.scope = token.scope
        
        db.save(obj: enty)
        
        SecurityUtil.shared().settingKeyLogin(key: token.accessToken!)
        
        let defaults = UserDefaults.standard
        defaults.setValue(self.userName?.text!, forKey: "username")
        
        
        self.performSegue(withIdentifier: "loginSuccess", sender: self)
  
        
    }
    func validateField() -> Bool {
        
        guard (self.userName?.text) != nil else {
            MessageUtil.showMessage(view: self.view, theme: .warning, title: "Login", detail: "Informe o Usuário", labelButton: "OK")
            return false
        }
        guard (self.password?.text) != nil else {
            MessageUtil.showMessage(view: self.view, theme: .warning, title: "Login", detail: "Informe a senha do Usuário", labelButton: "OK")
            return false
        }
        return true
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
