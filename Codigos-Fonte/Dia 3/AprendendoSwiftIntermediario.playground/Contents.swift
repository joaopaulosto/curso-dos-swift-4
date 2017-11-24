//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

str[str.startIndex..<str.endIndex]
let busca = ","
let indexVirgula = str.index(of: Character(",")) ?? str.endIndex

str[str.index(after: indexVirgula) ..< str.endIndex] //Cortar a string depois da virgula. Cria uma string iniciando depois do index a virgula até o último index - 1. Se Incluir o final fica fora do range
str[str.startIndex ..< indexVirgula] //Cortar a string ate antes da virgula
str[str.startIndex ... indexVirgula] //Cortar a string ate a virgula


let str2 = "abcde"
if let index = str.index(of: "c"){
    let domains = str2.prefix(upTo: index)
    print(domains)
}else{
    print("nada")
}


let range1 = 1...5
let range2 = 1..<5

var myNumberArray = [1, 2, 3, 4, 5]

myNumberArray[0...1] = [0,1]
myNumberArray

myNumberArray[0..<1] = [7,8]
myNumberArray





switch "v4" {
case "v1", "v2":
    print("Eh v1 ou V2")
case let x where x.hasSuffix("5"):
    print("termina com 5")
default:
    print("default")
}

switch ("curto", "algumacoisa") {
case let (v1, v2) where v1 == v2:
    "São iguais"
case ("curto", _):
    "Encontrei o curto"
default:
    break
}





//let switchInt: UInt64 = UInt64(UInt64.max)
let switchInt: UInt64 = UInt64(2<<(7*4)-1)
switch switchInt {
case 0...UInt64(UInt8.max):
    "UInt8 interval"
case 0...UInt64(UInt16.max):
    "UInt16 interval"
case 0...UInt64(UInt32.max):
    "UInt32 interval"
case 0...UInt64.max:
    "UInt64 interval"
default:
    break
}


let switchTuple = (500, "Jah era")

switch switchTuple {
case (200, "OK"):
    "Sucesso"
case (200, let message):
    "Sucesso com msg \(message)"
case (100...700, let message):
    "Status http  \(message)"
    fallthrough
case (500...600, _):
    "Ocorreu um erro qualquer:"

default:
    break
}




///Iteraç









