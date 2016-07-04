//: Playground - noun: a place where people can play

import Cocoa

var statusCode: Int = 404
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
    errorString += "\(unknownCode) is not a known error code."
default:
    //errorString = "\(statusCode) is not a recognised response code."
    errorString = "Unexpected error occured."
}

print(errorString)