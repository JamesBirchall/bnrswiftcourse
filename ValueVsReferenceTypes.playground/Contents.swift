//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
var playgroundString = str

playgroundString += "! Are you ready?"

print(str)  // because string as a value type (struct)

class GreekGod {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

let hecate = GreekGod(name: "Hecate")
let anotherHectate = hecate

anotherHectate.name = "AnotherHecate"

print(hecate.name)  // due to the GreekGod being a class so a reference type where object location is given to the anotehrHectate variable

struct Pantheon {
    let chiefGod: GreekGod
    let dateCreated = NSDate()  // as its a class advise is to use constant in a value type e.g. struct
}

let pantheon = Pantheon(chiefGod: hecate)
let zeus = GreekGod(name: "Zeus")
// pantheon.chiefGod = zeus    // duh... pantheon is a constant defined by let!
zeus.name = "Zeus Jr."
print(zeus.name)    // even though class is a constant, the name inside is a variable!

pantheon.chiefGod.name
let greekPantheon = pantheon
hecate.name = "Trivia"  // because hectate & another hectate are same object, so name changed on both!
greekPantheon.chiefGod.name

// avoid reference type objects inside of value types e.g. structs!

print(greekPantheon.dateCreated)

let athena = GreekGod(name: "Athena")
let gods = [athena, hecate, zeus]

let godsCopy = gods
gods.last?.name = "Jupiter" // changes both as its only 1 array with 2 constants pointing at a reference type - GreekGod class
gods
godsCopy

hecate === anotherHectate   // as both objects are identicle and therefore equal!
let x = 1
let y = 1
y == x  // true as both values are equal, but not identicle
// identitiy is that an object is pointing to the same memory
// 2 make classes abl to use ==, need to use the Equatable protocol and implement checks

/** when to decide
 1 - if you want a type to be passed by value - use a Struct!
 2 - if the type does not support subclasses inheriting from it, then use a struct
 3 - if the behaviour is relatively sraight forward and encompases a few simple values, consider using a struct
 4 - all other cases use a struct!
 
 **/