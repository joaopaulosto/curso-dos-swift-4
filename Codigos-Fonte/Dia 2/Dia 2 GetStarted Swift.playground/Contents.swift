//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//Let são constantes q não podem ser modificadas
//let inteiro = 5
var inteiro = 9
inteiro += 10
inteiro += 1

let `let` = 90; print(`let`)

//inteiro += "2"

let nome: String
nome = "Inicializado"
nome + "123"

let nome2: String? = "adadasda"
nome2?.description
nome2!.description + "----teste"

let aula1: Int? = 1
let aula2: Int = aula1!

//Nao pode incializar uma variavel como nil se ela não é option
//let nome3: String = nil

let stringVariasLinhas = """
Segundo
dia
defer
aula
aprendendo
declarar
variaveis
no Swift
"""

let soma = "2+2=\(stringVariasLinhas)"

//Criando array vazios do tipo Float
let myArray: [Float] = []

//Criando array explicito
let myArray2 = [Int]()
//criando array de forma implicita
let myArray3 = ["1", "2", "3"]

myArray3[0]
myArray3[1]
//O xcode verifica que não existe valor em uma determinada posicão em tempo de compiliação
//myArray3[3]
//Executa verificação do valor da variavel

//let variavel: Int = Int.max + 1

let myArray4 = ["4", "5", "6"]
//Concatenação de arrays do mesmo tipo
myArray3 + myArray4

let myArray5 = [1.1,2.1,1]


//Criação de Tuple de tipos heterogêneos

var myTuple = (0,var1: 0,"2")

let (a,b,c) = myTuple
a == myTuple.0
b == myTuple.1


//Dicionários
//Primeira maneira de criar um dictonary
//var nameOfEmail = [String:String]()
var nameOfEmail:[String:String] = [:]

nameOfEmail["Joao Paulo S Almeida"] = "joaopaulosto@gmail.com"
nameOfEmail["Joao Paulo S Almeida"]

let emailOfName = [
    "Joao Paulo S Almeida":"joaopaulosto@gmail.com"
]

let m1, m2, m3 : Int

let i💜Swift = false

/**
 Comentário Pai
    /**
        Comentário Filho
    */
*/
//Tipo de Dados com nome personalizado
typealias typeJP = Int
let meuTipoDado: typeJP = 100
let nro: typeJP = 0x10
let nro2 = 1.25e-2
let million = 1_0000000_000_000_000
1000
//Para reprsentação em hoxactal inicia com Zero seguido da letra o (ó)
0o0017

var myOptionalValue: Any
myOptionalValue = Int(2.2)
myOptionalValue = Float(3.5) + 2.2
myOptionalValue = Float(2.2) / 2

myOptionalValue = UInt8(255)
myOptionalValue = UInt16(8199)

var myOptionaValue2: Any?
myOptionaValue2 = Int(100)

if myOptionaValue2 != nil {
    print(myOptionaValue2)
}else{
    print("Nothing")
}

if let unwrapped = myOptionaValue2 {
    print("Não sou nil: \(unwrapped)")
}

let outraVariavelQualquer:Int? = Int("a")


if let firstNumber = Int("4"), let secondNumber = Int("42"),firstNumber < secondNumber && secondNumber < 100
{
    "\(firstNumber) < \(secondNumber) < 100"
}

//CAST
myOptionaValue2 = 5
//(myOptionaValue2 as? Int)! + 1 //Nao funciona

(myOptionaValue2 as? Int ?? 9) + 1

var valores = "12+30"

let lastOperation = "+"
let char = lastOperation[lastOperation.startIndex]
let sinalIndex = valores.index(of: char) ?? valores.startIndex
let endValue = valores[valores.index(after: sinalIndex)..<valores.endIndex]

//let char = lastOperation[lastOperation.startIndex]

//let index = display.index(of: char) ?? display.endIndex
//let ultimoNumero = display[index...display.endIndex]





























































