//
//  CalculatorManager.swift
//  Calculator
//
//  Created by João Paulo Scopus on 22/11/2017.
//  Copyright © 2017 CINQ. All rights reserved.
//

import Foundation

struct CalculatorManager {
    
    enum OperationEnum {
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double, Double) -> Double)
        case unknown
        case equals
    }
   
    
    private var accumulator: Double = 0.0
    private var binaryOperationMemory: PreviusBinaryOperation?
    
    private let operacoes = [
        "+": OperationEnum.binaryOperation({$0 + $1}),
        "-": OperationEnum.binaryOperation({$0 - $1}),
        "⨉": OperationEnum.binaryOperation({$0 * $1}),
        "÷": OperationEnum.binaryOperation({$0/$1}),
        "±": OperationEnum.unaryOperation( { $0 == 0 ? $0 : -$0 }),
        "√": OperationEnum.unaryOperation(sqrt),
        "%": OperationEnum.binaryOperation({ $0 * $1/100 }),
        "=": OperationEnum.equals
    ]
    
    private struct PreviusBinaryOperation {
        let function:((Double, Double) -> Double)
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
    
    mutating func clearMemony(){
        self.binaryOperationMemory = nil
    }
    
    var result: Double {
        get {
            return self.accumulator
        }
    }
    
    mutating func performOperation(_ symbol: String){
        
        guard let operation = operacoes[symbol] else {
            return
        }
        switch operation {
        case .unaryOperation(let op):
            accumulator = op(accumulator)
        case .binaryOperation(let oper):
            binaryOperationMemory = PreviusBinaryOperation(function: oper, firstOperand: self.accumulator)
        case .equals:
            doPreviusBinaryOperation()
        default:
            break
        }
    }
    
    mutating func doPreviusBinaryOperation() {
        guard let memory = binaryOperationMemory else { return }
        accumulator = memory.perform(with: accumulator)
        self.binaryOperationMemory = nil
    }
    
    mutating func setOperand(_ operation: Double){
        self.accumulator = operation
    }
    
}
