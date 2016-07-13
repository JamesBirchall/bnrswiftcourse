//: Playground - noun: a place where people can play

import Cocoa

let playground = "Hello, playground"
var mutablePlayground = "Hello, mutable playground"

mutablePlayground += "!"

//for c: Character in mutablePlayground.characters {
//    print("\(c)")
//}

// type inference version!
for c in mutablePlayground.characters {
    print("\(c)")
}

let oneCoolDude = "\u{1F60E}"
let aAcute = "\u{0061}\u{0301}"  // extended grapheme cluster, characters can be built from one or more unicode scalars, some have shortcut versions which only use 1 scalar

let aAcutePrecomposed = "\u{00E1}"  // 

if aAcute == aAcutePrecomposed {
    print("They are the same!") //because of canonical equivalence
}

// how to get count of characters
print("aAcute: \(aAcute.characters.count), aAcutePrecomposed: \(aAcutePrecomposed.characters.count)")

for scalar in playground.unicodeScalars {
    //print("\(scalar.value)")
    let hexValue = String(format: "%X", scalar.value)
    print("\(scalar.value) or \(hexValue) in hex")
}

// using String.Index values to find specific character in string
let fromStart = playground.startIndex
let toPosition = 4
let end = fromStart.advancedBy(toPosition)
let fifthCharacter = playground[end]

// or range to get multiple characters
let range = fromStart...end
var firstFiveCharacters = playground[range]

let helloStringAsUnicode = "\u{0048}\u{0065}\u{006C}\u{006C}\u{006F}"

firstFiveCharacters.removeAll() // because its a collection type can remove all values

firstFiveCharacters += helloStringAsUnicode
print("\(helloStringAsUnicode)")

