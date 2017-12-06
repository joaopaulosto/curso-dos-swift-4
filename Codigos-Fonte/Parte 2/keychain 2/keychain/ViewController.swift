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
    
    let kNumberKey = "kNumberKey"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func newNumber() {
        let randomNumber = Int(arc4random())
        print("O número randômico é: \(randomNumber)")
        KeyChain.save(key: kNumberKey, data: Data(from: randomNumber))
    }
    
    @IBAction func loadNumber() {
        let value = KeyChain.load(key: kNumberKey, type: Int.self)
        randomNumberLabel.text = "O número carregado é: \(value)"
    }
}

