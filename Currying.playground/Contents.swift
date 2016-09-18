//: Playground - noun: a place where people can play

import Cocoa

func greetName(name: String, withGreeting greeting: String) -> String {
    return "\(greeting) \(name)"
}

let personalGreeting = greetName(name: "Jim", withGreeting: "Hello there,")
print(personalGreeting)

// always have to have the syntax for currying below
func greetingForName(name: String) -> (String) -> String {
    
    func greeting(greeting: String) -> String {
        return "\(greeting) \(name)"
    }
    
    return greeting
}

let greeterFunction = greetingForName(name: "Jimmy")
let theGreeting = greeterFunction("Why hello,")

struct Person {
    var firstName = "Jim"
    var lastName = "Birchall"
    
    mutating func changeName(fn: String, ln: String){
        firstName = fn
        lastName = ln
    }
    
}

var p = Person()
let changer = Person.changeName
changer(&p)("James", "Birch") // mutating keyword is curried function with self as first argument
print(p)
p.changeName(fn: "Jim", ln: "Birchall")
print(p)