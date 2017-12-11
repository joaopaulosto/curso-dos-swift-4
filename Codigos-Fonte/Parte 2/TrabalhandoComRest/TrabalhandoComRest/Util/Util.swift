//
//  Util.swift
//  TrabalhandoComRest
//
//  Created by João Paulo Scopus on 06/12/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import Foundation
import UIKit
import SwiftMessages

struct AppConfig {
    fileprivate static let kClientSecrecte = "mxylLGI4n6xRa1IxpOpiTMElQsCXl06gjn5I3SL10u82TmWjJqdQZYDnhMWSaiseXLdNIP8cTjuFZDWfMPCMmvkUXvCL1aQuResA63uelytSmYCHafXrFyFtxnzgzyxz"
    fileprivate static let kClientId = "UXFI1NduTUcpTJ169sFZYrRGwUQFnYxkXafL9B0V"
    static let kHttpEndpoint = "http://localhost:8000"
    static let kServiceDefaultURL = "/api/v1/tasks/"
    static let kServiceAuthenticationURL = "/api/oauth/token/"
    static let KContentyType = "application/json"
    static let COR_PADRAO = UIColor(displayP3Red: CGFloat(74), green: CGFloat(144), blue: CGFloat(226), alpha: CGFloat(100))
    static let kLoginHeadSecurity = ["client_id": AppConfig.kClientId, "client_secret": AppConfig.kClientSecrecte, "grant_type": "password"]
    static let kRequestHeadSecurity = ["Content-Type": KContentyType, "Accept":  KContentyType, "Accept-Language": "pt-br", "Authorization": "Bearer "]
  
}
class SecurityUtil {
    private var keySession: String = ""
    
    private static var sharedInstance: SecurityUtil = {
        let instance = SecurityUtil()
        
        return instance
    }()
    
    class func shared() -> SecurityUtil {
        return sharedInstance
    }
    private init() {
        
    }
    func settingKeyLogin(key: String){
        self.keySession = key
    }
    func getSecurityHeader() -> [String: String]{
        var dict = AppConfig.kRequestHeadSecurity
        dict["Authorization"] = "Bearer \(self.keySession)"
        return dict
    }

    func createHeadLogin(userName: String, password: String) -> [String: String]{
        var dict = AppConfig.kLoginHeadSecurity
        dict["username"] = userName
        dict["password"] = password
        return dict
    }
}

typealias PositiveHandle = () -> Void
typealias NegativeHandle = () -> Void

class MessageUtil {
    
    class func showConfirm(target: UIViewController, title: String, message: String, positiveButton: String, positiveSelector: @escaping PositiveHandle, negativeButton: String, negativeHande: @escaping NegativeHandle){
        
        // Declare Alert message
        let dialogMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Create OK button with action handler
        let positiveOption = UIAlertAction(title: positiveButton, style: .default, handler: { (action) -> Void in
             positiveSelector()
        })
        
        // Create Cancel button with action handlder
        let negativeOption = UIAlertAction(title: negativeButton, style: .cancel) { (action) -> Void in
           negativeHande()
        }
        
        //Add OK and Cancel button to dialog message
        dialogMessage.addAction(positiveOption)
        dialogMessage.addAction(negativeOption)
        
        // Present dialog message to user
        target.present(dialogMessage, animated: true, completion: nil)
        
        
    }
    class func showMessage(view: UIView, theme: Theme, title: String, detail: String, labelButton: String?){
        let view = MessageView.viewFromNib(layout: .cardView)
        
        view.configureTheme(theme)
        view.configureContent(title: title, body: detail, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: labelButton) { _ in
            SwiftMessages.hide()
        }
        var config = SwiftMessages.defaultConfig
        
        config.presentationContext = .window(windowLevel: UIWindowLevelNormal)
        config.presentationStyle = .center
        view.button?.isHidden = labelButton == nil
        
        SwiftMessages.show(config: config, view: view)
    }
    
    
}



