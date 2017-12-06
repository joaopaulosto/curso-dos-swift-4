//
//  ViewController.swift
//  nsuserdefaults
//
//  Created by Lucas Paim on 22/11/2017.
//  Copyright © 2017 Lucas Paim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelTimes: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let time = UserDefaults.standard.integer(forKey: AppConfig.kTimesOpenKey)
        
        
        labelTimes.text = "Você já abriu este app: \(time) vez(es)"
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

