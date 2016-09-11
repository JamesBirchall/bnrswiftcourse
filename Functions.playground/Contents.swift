//: Playground - noun: a place where people can play

import Cocoa

// basic functions, takes no parameters and returns no paramters
func printGreeting() {
    print("Hello, Function...")
}

printGreeting() // calling a function

// parameter taking function
func printYourName(name: String) {  // takes 1 string
    print("Hello there, \(name)");
}
printYourName("Jimmy")  // printYourName(_:) - takes one parameter, first is unnamed

// function which takes more than 1 parameter
//func divisionDescription(num: Double, den: Double){
//    print("\(num) divided by \(den) is \(num / den)")   // adding math routine to string
//}
//divisionDescription(9.0, den: 2.0)

// same function but using external paraeters
func divisionDescription(forNumerator num: Double, andDinominator den: Double){
    print("\(num) divided by \(den) is \(num / den)")   // adding math routine to string
}
divisionDescription(forNumerator: 9.0, andDinominator: 2.0) // fix function

// variadic parameters - contain x of the same type in parameters list
func printPersonalGreetings(names: String...){
    for name in names {
        print("Hello \(name), welcome to the playground!")
    }
}
printPersonalGreetings("James", "Emily", "Shawn", "Tom", "Ed")

// default parameters
func divisionDescription2(forNumerator num: Double, andDenominator dem: Double, withPunctuation punctuation: String = "."){
    print("\(num) divided by \(dem) is \(num / dem)\(punctuation)")
}
divisionDescription2(forNumerator: 3.0, andDenominator: 1.0)
divisionDescription2(forNumerator: 3.0, andDenominator: 1.0, withPunctuation: "!")

// in-out parameters, allowing life outside the function - e.g. pass by reference!
var error = "The request failed:"
func appendErrorCode(code: Int, inout toErrorString errorString: String){
    if code == 400 {
        errorString += " bad request."
    }
}
appendErrorCode(400, toErrorString: &error)  // & to pass by reference

// returning from a function - to send information back to caller
// -> (TYPE) is how this is done before opening brace of function
func divisionDescription3(forNumerator num: Double, andDenominator dem: Double, withPunctuation punctuation: String = ".") -> String{
    return "\(num) divided by \(dem) is \(num / dem)\(punctuation)"
}
// nest the call to function in print as it returns a string
print(divisionDescription3(forNumerator: 12.0, andDenominator: 3.0, withPunctuation: "!"))

// nested functions
func areaofTriangle(withBase base: Double, andHeight height: Double) -> Double {
    let numerator = base * height
    // nested function - calling code is optional in function
    func divide() -> Double {
        return numerator / 2
    }
    return divide()
}
let myArea = areaofTriangle(withBase: 3.0, andHeight: 5.0)
print("\(myArea)")

// multiple returns - functions returning more than one value
func sortEvenOdd(numbers: [Int]) -> (evens: [Int], odds: [Int]){
    var evens = [Int]()
    var odds = [Int]()
    
    for number in numbers {
        if number % 2 == 0 {
            evens.append(number)
        } else {
            odds.append(number)
        }
    }
    
    return (evens, odds)
}
let aBunchOfNumbers = [1,4,54,12,23,65,78,111,0]
let theSortedNumbers = sortEvenOdd(aBunchOfNumbers)
print("The even numbers are: \(theSortedNumbers.evens); the odd numbers are \(theSortedNumbers.odds).")

// optional returns types - if you may return something as nil '?'
func grabMiddleName(name: (String, String?, String)) -> String? {
    return name.1
}

let middleName = grabMiddleName(("James", "Tony", "Birchall"))
if let theName = middleName {
    print(theName)
}

// exiting early from a function - guard statements
func greetByMiddleName2(name: (first: String, middle: String?, last: String)) -> String {
    guard let middleName = name.middle else {
        return "Hey there!"
    }
    
    return "Hey \(middleName)"
}
print(greetByMiddleName2(("James", nil, "Birchall")))

// function types - explicitly use function type and assigned a function to a variable
// effectively function names are variables as well
let evenOddFunction: ([Int]) -> ([Int], [Int]) = sortEvenOdd
let sortedNumbers = evenOddFunction([1,4,5,6,7,8,9])
print(sortedNumbers)

// bronze challenge - only print middle name if <= 4 characters
func greetByMiddleName3(name: (first: String, middle: String?, last: String)) -> String {
    guard let middleName = name.middle where name.middle?.characters.count <= 4 else {
        return "Hey there!"
    }
    
    return "Hey \(middleName)"
}
print(greetByMiddleName3(("James", "Anthony", "Birchall")))

// silver challenge
func beanSifter(groceryList: [String]) -> (beans: [String], otherGroceries: [String]) {
    var beans = [String]()
    var otherGroceries = [String]()

    for item in groceryList {
        // does it contain suffix of 'beans' -> lower case
        if item.lowercaseString.hasSuffix("beans") {
            // beans found
            beans.append(item)
        } else {
            otherGroceries.append(item)
        }
    }
    
    return (beans, otherGroceries)
}

let result = beanSifter(["green Beans","milk","black beans","pinto Beans","apples"])
print(result.beans)
print(result.otherGroceries)
