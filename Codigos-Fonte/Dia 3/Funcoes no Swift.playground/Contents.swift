//: Playground - noun: a place where people can play

import UIKit


func soma(_ val1: Int, _ val2: Int) -> Int {
    return val1 + val2
}
func soma(com a:Int, e b: Int) -> Int {
    return a + b
}
soma(2, 5)

soma(com: 10, e: 15)

//[somaCom: 10 e: 15]

func somaSubrai(_ a: Int, _ b: Int) -> (Int, Int) {
    return(a+b, a-b)
}

//for x in somaSubrai(50, 25) {
//   print(x)
//}

func soma(default: Int, valores: Int...) -> Int {
    var sum: Int = `default`
    for v in valores {
        sum += v
    }
    return sum
}
soma(default: 0, valores: 1,2,3,4)

//Função que passa um parametro como referencia
func soma(referencia: inout Int, valores: Int...)  {

    for v in valores {
        referencia += v
    }
}
var ref = 100
soma(referencia: &ref, valores: 1000,345,543)

func find(inArray values: [Any], withPredicate predicate: (Any) -> Bool) -> Int? {
    for (i, v) in values.enumerated(){
        if predicate(v) {
            return i
        }
    }
    return nil
}
func compare(val: Any) -> Bool{
    return val as! String == "c"
}
var index = find(inArray: ["a", "b", "c", "d"], withPredicate: compare)

var index2 = find(inArray: ["a", "b", "c", "d"])  {
    $0 as! String == "c"
}


func binaryOperation(_ operation: String) -> ((Double, Double) -> Double)? {
    switch operation {
    case "+":
        return { $0 + $1 }
    case "-":
        return { (val1: Double, val2: Double) -> Double in val1 - val2 }
    case "x":
        return { $0 * $1 }
    default:
        return nil
        break
        //return { (val1: Double, val2: Double) -> Double in val1 + val2 }
    }
}
/*
func binaryOperation2(_ op: String) -> ((Double, Double) -> Double)? {
    func sum(_ a: Double, _ b: Double) -> {
        return a + b
    }
    func subtract(_ a: Double, _ b: Double) -> Double {
        return a - b
    }
    var dict: [String: (Double, Double) -> Double] = [:]
    dict["+"] = sum
    dict["-"] = subtract
    
    return dict[op]
} */

binaryOperation("-")?(10, 30)
//binaryOperation2("-")?(10, 30)


func iterator(_ array: [Int]) -> () -> Int?{
    var i = 0
    return  {
        i += 1
        return array[i-1]
        return i<array.count ? array[i-1] : nil
    }
    
}
//CLOSURE
let myArrayCosmo = [10,11,12,13,14,15]
let it = iterator(myArrayCosmo)
it()
it()
it()
it()
it()
it()
//it()


//GUARD LET

func processUser(_ name: String) ->  (Float, String)? {
    let saldo = ["Joao": 1500.0, "Jose": 300.0]
    let sobreNome = ["Joao": "Almeida", "Jose": "Silva"]
    
    guard let money = saldo[name] else { return nil }
    guard let lastName = sobreNome[name] else { return nil }
    
    return (Float(money), "\(name) \(lastName)")
}

processUser("Joao")
processUser("Maria")

var overFlow : Int = Int.max
overFlow = overFlow &+ 1

2 + 2 + 2
(2 << 2) << 2
1<<(2+5)

3&2|3|(4^1)



































