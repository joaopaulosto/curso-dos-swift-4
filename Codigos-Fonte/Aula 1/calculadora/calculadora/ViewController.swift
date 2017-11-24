//
//  ViewController.swift
//  calculadora
//
//  Created by João Paulo Scopus on 21/11/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtVisor: UILabel!
    @IBOutlet weak var btnClear: UIButton!
    
    var userIsTyping: Bool = false
    
    var firstValue: Double = 0
    var secundValue: Double = 0
    var lastOperation: String? = nil
    var totalValue: Double = 0
   
    @IBAction func onTouchDown(_ button: UIButton) {
      self.writeValueButton(button)
    }
    
    @IBAction func acaoBotao(_ button: UIButton) {
       let x = button.titleLabel?.text
        self.trataOperacoes(operacao: x!)
    }
    func pegaUltimoValor() -> String {
        let display = txtVisor.text!
        if lastOperation != nil{
            let char = lastOperation![lastOperation!.startIndex]
            let sinalIndex = display.index(of: char) ?? display.startIndex
            let endValue = display[display.index(after: sinalIndex)..<display.endIndex]
            
            return String(endValue)
        }else{
            return display
        }
        
        
        
    }
    func trataOperacoes(operacao: String){
        juntaValor(valor: Double(pegaUltimoValor())!)
        executaOperacao()
        var imprime: Bool = true
        switch operacao {
        case "+":
            print("adição")
        case "−":
            print("subtração")
        case "%":
            print("percentual")
        case "÷":
            print("divisão")
        case "×":
            print("multiplicação")
        case "=":
            print("igual")
        case "+/-":
            var newValue = Double(self.txtVisor.text!)
            newValue = newValue! * -1
            self.txtVisor.text = String(newValue!)
            print("negativo/positivo")
            imprime = false
        default:
            break
        }
        if imprime {
            lastOperation = operacao
            self.adicionaValorVisor(valor: operacao)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(normalTap(_:)))
        tapGesture.numberOfTapsRequired = 1
        btnClear.addGestureRecognizer(tapGesture)
        
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTap(_:)))
        btnClear.addGestureRecognizer(longGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func writeValueButton(_ button: UIButton){
        let conteudo = String(button.tag)
        adicionaValorVisor(valor: conteudo)
    }
    func adicionaValorVisor(valor: String){
        
        if userIsTyping {
            let textDisplay = txtVisor.text ?? ""
            txtVisor.text = textDisplay + valor
        }else{
            txtVisor.text = valor
            userIsTyping = true
        }
    }
    
    var displayValue: Double {
        get {
            return Double(txtVisor.text!)!
        }
        set {
            txtVisor.text = String(newValue)
        }
    }

    func removeDigito(textoVisor: String) -> String{
        var newValue: String
        newValue = String(textoVisor[textoVisor.startIndex..<textoVisor.index(textoVisor.endIndex, offsetBy: -1)])
        return newValue
    }
    func juntaValor(valor: Double) {
        if firstValue == 0 {
            firstValue = valor
        }else{
            secundValue = valor
        }
    }
    
    
    func executaOperacao() {
        var result: Double = 0
        if let opx = lastOperation{
            switch opx {
            case "+":
                result = firstValue + secundValue
            default:
                break
            }
        }
        
        if result != 0 {
            firstValue = result
            secundValue = 0            
            txtVisor.text = String(firstValue)
        }
        
    }

    
/** GESTURE **/
  
    
    @objc func normalTap(_ sender: UIGestureRecognizer){
        print("Normal tap")
        if(txtVisor.text!.count > 1){
            txtVisor.text = removeDigito(textoVisor: txtVisor.text!)
        }else{
            txtVisor.text = "0"
            userIsTyping = false
            totalValue = 0
        }
    }
    
    @objc func longTap(_ sender: UIGestureRecognizer){
        print("Long tap")
        if sender.state == .ended {
            
        }
        else if sender.state == .began {
            txtVisor.text = "0"
            userIsTyping = false
            //print("UIGestureRecognizerStateBegan.")
            //Do Whatever You want on Began of Gesture
        }
    }
    

}

