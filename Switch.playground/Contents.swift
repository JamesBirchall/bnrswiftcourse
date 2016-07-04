//: Playground - noun: a place where people can play

import Cocoa

var statusCode: Int = 200
var errorString: String = "The request failed with the error:"

// switch in Swift doesn't need break code to stop execution further through
switch statusCode {
//case 400:
//    errorString = "Bad Request"
//case 401:
//    errorString = "Unauthorised"
//case 403:
//    errorString = "Forbidden"
//case 404:
//    errorString = "Not Found"
//default:    // must have default because unlimited variations of statusCode in this case
//    errorString = "None"
//case 400, 401, 403, 404:
//    errorString = "There was something wrong with this request."
//    fallthrough // fallthrough to continue to next case
//default:
//    errorString += " Please review the request and try again"

// ranges are int...int
case 100, 101:
    errorString += " Information, \(statusCode)."   // string interpolation
case 204:
    errorString += " Success but no content, 204."
case 300...307:
    errorString += " Redirection, \(statusCode)."
case 400...417:
    errorString += " Client error, \(statusCode)."
case 500...505:
    errorString += " Server error, \(statusCode)."
//case let unknownCode:   // value binding into a local variable only available in this case code
//    errorString = "\(unknownCode) is not a known response code."
case let unknownCode where (unknownCode >= 200 && unknownCode < 300) || unknownCode > 505:
    errorString = "\(unknownCode) is not a known error code."
default:
    //errorString = "\(statusCode) is not a recognised response code."
    errorString = "Unexpected error occured."
}

print(errorString)

// tuple, a way of passing a single variable made up  of compound variables
let error = (statusCode, errorString)

print(error.0)
print(error.1)
//print(error.2) //get an error there is no 3rd variable

// can create named elements inside tuple
let errorGivenNames = (code: statusCode, message: errorString)
print(errorGivenNames.code)
print(errorGivenNames.message)

let firstErrorCode = 200
var secondErrorCode = 404
let errorCodes = (first: firstErrorCode, second: secondErrorCode)

switch errorCodes {
case (404, 404):
    print("No items found.")
case (404, _):  // _ is a wildcard to match any value present
    print("First item not found.")
case (_, 404):
    print("Second item not found.")
default:
    print("All items found")
}

// switch useful when needing to match multiple conditions, if/else is  checking against single conditions
// if-case is alternative to if-else when needing to match a single condition with pattern matching
// can add a where clause to the if as well
// this provides a elegent solution to switch when you need a single condition and don't care about default case

let age = 31
if case 18...35 = age where age >= 21 {
    print("A cracking age to allowing drinking in the US...")
}


let point = (x: 1, y: 4)

switch point {
case let q1 where (point.x > 0) && (point.y > 0):
    print("\(q1) is in quadrant 1")
case let q1 where (point.x < 0) && (point.y > 0):
    print("\(q1) is in quadrant 2")
case let q1 where (point.x < 0) && (point.y < 0):
    print("\(q1) is in quadrant 3")
case let q1 where (point.x > 0) && (point.y < 0):
    print("\(q1) is in quadrant 4")
default:
    print("Case not covered")
}

