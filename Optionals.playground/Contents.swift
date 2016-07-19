//: Playground - noun: a place where people can play

import Cocoa

var errorCodeString: String?    //optional string
errorCodeString = "404"
var errorDescription: String?   // optional string

print(errorCodeString)

if errorCodeString != nil {
    let theError = errorCodeString! // forced unwrapping should be gaurded else error crash!
    print(theError)
}

// optional binding makes code more succinct
if let theErrorAgain = errorCodeString {
    print(theErrorAgain)
} else {
    // there was no value in the optional...
}

// nesting optionals
//if let theErrorOnceMore = errorCodeString {
//    if let errorCodeInteger = Int(theErrorOnceMore) {
//        print("\(theErrorOnceMore): \(errorCodeInteger)")
//    }
//}

// unwrapping multiple optionals rather than nesting... notice where also can be used
if let theErrorOnceMore = errorCodeString, errorCodeInteger = Int(theErrorOnceMore) where errorCodeInteger == 404 {
    //print("\(theErrorOnceMore): \(errorCodeInteger)")
    errorDescription = "\(errorCodeInteger + 200): the requested resource was not found."
}

var upperCaseErrorDescription = errorDescription?.uppercaseString
errorDescription // shows this version was unchanged

// modifying an optional in place
upperCaseErrorDescription?.appendContentsOf(" PLEASE TRY AGAIN.")
// upperCaseErrorDescription = nil
print(upperCaseErrorDescription ?? "NO VALUE.") // optional  vs. defauly value if nil

// implicitly unwrapped optionals
var errorCodeStringTwo: String!
errorCodeStringTwo = "404"
//errorCodeStringTwo = nil // error causes fatal runtime error claiming nil while unwrapping Optional value
print(errorCodeStringTwo)   // automatically unwrapped - crash if is nil though!

// nil coalescing operator ??
//errorDescription = nil
let description = errorDescription ?? "No error."   // rather than a big if-let else


