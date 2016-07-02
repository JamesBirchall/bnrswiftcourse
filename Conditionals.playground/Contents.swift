//: Playground - noun: a place where people can play

import Cocoa

var population: Int = 542200
var message: String
var hasPostOffice: Bool = true

if population < 10000 {
    message = "\(population) is a small town!"
} else if population >= 10000 && population < 50000 {
    
    message = "\(population) is a medium sized town!"
} else if population >= 100000 {
    message = "\(population) is massive!"
}else {
    message = "\(population) is pretty big!"
}
//    if population >= 10000 && population < 50000{
//        message = "\(population) is a medium sized town!"
//    } else {
//        message = "\(population) is pretty big!"
//    }
//}

// tertiary operator, for smaller form factor if statement
//message = population < 10000 ? "\(population) is a small town!" : "\(population) is pretty big!"

print(message)

if !hasPostOffice {
    print("Where do we buy stamps?")
}