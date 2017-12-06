//
//  ViewController.swift
//  keychain
//
//  Created by Lucas Paim on 22/11/2017.
//  Copyright © 2017 Lucas Paim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var randomNumberLabel: UILabel!
    
    let kLoadCount = "kLoadCount"
    let kNumberKey = "kNumberKey"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let count = UserDefaults.standard.integer(forKey: kLoadCount)
        if count == 0 {
            KeyChain.delete(key: kNumberKey)
        }
        UserDefaults.standard.setValue(count + 1, forUndefinedKey: kLoadCount)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func newNumber() {
        let randomNumber = Int(arc4random())
        print("O número randômico é: \(randomNumber)")
        let data = Data(from: randomNumber)
        let status = KeyChain.save(key: kNumberKey, data: data)
        print(status)
    }
    
    @IBAction func loadNumber() {
        let data = KeyChain.load(key: kNumberKey)
        let value = data?.to(type: Int.self)
        randomNumberLabel.text = "O número carregado é: \(value!)"
    }
}

