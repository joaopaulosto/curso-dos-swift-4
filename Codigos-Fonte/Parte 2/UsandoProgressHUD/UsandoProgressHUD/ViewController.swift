//
//  ViewController.swift
//  UsandoProgressHUD
//
//  Created by João Paulo Scopus on 06/12/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import UIKit
import MBProgressHUD

class ViewController: UIViewController {

    
    
    
    
    @IBOutlet weak var subViewProgress: UIView!
    @IBAction func iniciarBotao(_ sender: Any) {
        
        let progress = MBProgressHUD.showAdded(to: self.subViewProgress, animated: true)
        progress.label.text = "Fazendo alguma coisa"
        progress.mode = .determinate
        
        
        
    }
    @IBAction func tempBotao(_ sender: Any) {
        
    }
    @IBAction func pararBotao(_ sender: Any) {
        self.pararProgress()
    }
    func pararProgress(){
        MBProgressHUD.hide(for: self.subViewProgress, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.progressView = MBProgressHUD.showAdded(to: self.view, animated: true)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

