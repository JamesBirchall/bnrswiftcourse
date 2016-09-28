//: Playground - noun: a place where people can play

import Cocoa

//struct Point: Equatable, Comparable {
// Comparable already delacres conformance to Equatable so is unnecesary
struct Point: Comparable {
    let x: Int
    let y: Int
    
    func distance() -> Double {
        return sqrt(Double(x*x + y*y))
    }
    
    // static means function is associated with Struct rathern than instance of Struct
    static func ==(lhs: Point, rhs: Point) -> Bool {
        return (lhs.x == rhs.x) && (lhs.y == rhs.y)
    }
    
    static func <(lhs: Point, rhs: Point) -> Bool {
        
        return (lhs.distance() < rhs.distance())
    }
    
    // Bronze challenge
    static func +(lhs: Point, rhs: Point) -> Point {
        return Point(x: lhs.x+rhs.x, y: lhs.y+rhs.y)
    }
}

class Person: CustomStringConvertible, Equatable {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    var description: String {
        return "Person(\(name) is \(age) years old.)"
    }
    
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return (lhs.name == rhs.name) && (lhs.age == rhs.age)
    }
    
}

let a = Point(x: 3, y: 4)
let b = Point(x: 3, y: 4)
//
//let abEqual = (a == b)  // works when function == is given in struct 
//let abNotEqual = (a != b)   // get this for free!

let c = Point(x: 3, y: 4)
let d = Point(x: 2, y: 5)

let cdEqual = (c == d)  // false obvcs

// plat challenge
// proof we fixed to find distance between 2 points to get > < etc
let cLessThanD = (c < d)    // true

(c <= d)    // free is both < and == implement
(c > d)     // free is both < and == implement
(c >= d)    // free is both < and == implement

// Bronze challenge proof
let addedPoint = a + b
print("addedPoint.x \(addedPoint.x), addedPoint.y \(addedPoint.y)")

let person1 = Person(name: "Jim", age: 29)
let person2 = Person(name: "Em", age: 29)

let people: [Person] = [person1, person2]
print(people)

// gold challenge proof
let index = people.index(of: person1)
let index2 = people.index(of: person2)  // index 2 as thats where first instance is found in array



