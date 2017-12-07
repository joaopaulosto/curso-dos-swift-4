//
//  Util.swift
//  TrabalhandoComRest
//
//  Created by João Paulo Scopus on 06/12/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import Foundation
import UIKit

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



