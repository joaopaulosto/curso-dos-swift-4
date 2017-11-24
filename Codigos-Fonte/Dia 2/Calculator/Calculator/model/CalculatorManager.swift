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
        case binaryPercent((Double, Double) -> Double)
        case constant (Double)
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
        "%": OperationEnum.binaryPercent({  $0 * ($1 / 100) }),
        "x": OperationEnum.constant(Double.pi),
        "e": OperationEnum.constant(M_E),
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
        let secundOperator = binaryOperationMemory?.firstOperand != nil
        
        switch operation {
        case .unaryOperation(let op):
            accumulator = op(accumulator)
        case .binaryOperation(let op):
            binaryOperationMemory = PreviusBinaryOperation(function: op, firstOperand: self.accumulator)
        case .binaryPercent(let op):
            if let firstOp = binaryOperationMemory?.firstOperand {
                self.accumulator = op(firstOp, self.accumulator)
            }else{
                self.accumulator = op(Double(1), self.accumulator)
            }
        case .equals:
            doPreviusBinaryOperation()
        case .constant(let op):
            self.accumulator =  op
        default:
            break
        }
        if secundOperator {
            doPreviusBinaryOperation()
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
    
    mutating func clearOperand() {
        self.accumulator = 0.0
        self.binaryOperationMemory = nil
    }
    
}
