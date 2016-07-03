//: Playground - noun: a place where people can play

import Cocoa

print("The maximum Int value is \(Int.max)")
print("The minimum Int value is \(Int.min)")

var largeNumber:UInt = 9223372036854775807

print("The maximum UInt value is \(UInt.max)")

print("Max Int * 2 = \(largeNumber * 2 + 1)")

print("The maximum Int8 value is \(Int8.max)")
print("The minimum Int8 value is \(Int8.min)")
print("The maximum UInt8 value is \(UInt8.max)")
print("The minimum UInt8 value is \(UInt8.min)")

let numberOfPages: Int = 10 //specifically set to an Int
let numberOfChapters = 3 //infered by compiler

//let numberOfPeople: Int8 = 128
//let volumeAdjustent: Uint32 = -1000

print(10 + 2 * 5)
print(30 - 5 - 5)
print((10 + 2) * 5)
print(30 - (5 - 5))

print(11 / 3)   //always rounds to 0 the fractional part

print(11 % 3)
print(-11 % 3)

let y: Int8 = 120
//let z = y + 10
let z = y &+ 10
print("120 &+ 10 for UInt8 = \(z)")

let a: Int16 = 200
let b: Int8 = 50
//let c = a + b // errorbecause not same types
let c = a + Int16(b)    // works as we converted b to a's type of Int16

let d1 = 1.1 //implicit double
let d2: Double = 1.1 // explicit, double = 64 bit floating number
let d3: Float = 100.3   // float = 32 bit precision

print(10.0 + 11.4)
print(11.0 / 3.0)
print(12.4 % 5.0)

if d1 == d2 {
    print("d1 and d2 are the same")
}

let d4 = d1 + 0.1

// floating point addition not always what it seems
print("d1 + 0.1 is \(d1 + 0.1)")
if d4 == 1.2 {
    print("d1 + 0.1 is equal to 1.2")
} else {
    print(d4)   //swift is rounding the number here...
}


// Binary representation of -1 in 8 Bit signed Integer?
// 0 0 0 0 0 0 0 0 = 0
// 1 1 1 1 1 1 1 1 = -1 // think of rolling back
// = 0xFF in Hexidecimal
// In unsigned land this would equal 255 rather than minus 1





