//: Playground - noun: a place where people can play

import UIKit



var total = 0

for i in 0...500 {
    total += i
}
total

for c in "Hoje eh quinta feira"{
    print(c)
}

let myArray = [10, 20, 30, 40, 50]

for (i, c) in myArray.enumerated() {
    print("\(i) - \(c)")
}
print("\n")

for (i, c) in myArray.reversed().enumerated(){
    print("\(i) - \(c)")
}

let dictonary = [200: "ok", 400: "not found", 500 : "server internal error"]
print("\n")

for item in dictonary {
    print("Chave: \(item.key) Valor: \(item.value)")
}
print("\n")
for (key, value) in dictonary {
    print("Chave: \(key) Valor: \(value)")
}
var index = 100;
repeat {
    print("Imprime")
    index -= 1
} while (index > 0)






