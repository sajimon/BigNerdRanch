//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var str2 = "Marcin2"
let constStr = str

var nextYear: Int
var bodyTemp: Float
var hasPet: Bool

nextYear = 2021
bodyTemp = 30.2
hasPet = true

var arrayOfInts: [Int] = [12,3,4,5,6,4]

var dictCounryCodes: [String:String] = ["PL":"Poland", "USA":"United States of America"]

//Initializers

let str3 = String("adbC");
str3.capitalizedString

arrayOfInts.append(102)

var optionalFloat1: Float?
var optionalFloat2: Float?
var optionalFloat3: Float?

//let avgFloat = ((optionalFloat1! + optionalFloat2! + optionalFloat3!) / 3)

optionalFloat1 = 1
optionalFloat2 = 322
optionalFloat3 = 234

if let r1 = optionalFloat1,
       r2 = optionalFloat2,
    r3 = optionalFloat3{
    let avgFloat = ((optionalFloat1! + optionalFloat2! + optionalFloat3!) / 3)
}else
{
    let err = "Was nil"
}

//Loops and String Interpolation

var countingUp = ["one", "two"]
countingUp.append("three")

for var i = 0 ; i < countingUp.count ; i+=1
{
    let string = countingUp[i]
}

let range = 0..<countingUp.count
for i in range{
    let string = countingUp[i]
}

for string in countingUp{
    string
}

for (i, string) in countingUp.enumerate() {
    let napis = string
    let index = i
}


//Enumerations and the Switch Statement
enum PieType: Int {
    case Apple = 0
    case Cherry
    case Pecan
}

let favPie = PieType.Apple

let name: String
switch favPie {
case .Apple:
    name = "Apple"
    
default:
    name = "Apple"
}




