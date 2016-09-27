//: Playground - noun: a place where people can play

import Cocoa

//struct Stack {
//    var items = [Int]()
//    
//    mutating func push(newItem: Int) {
//        items.append(newItem)
//    }
//    
//    mutating func pop() -> Int? {
//        guard !items.isEmpty else {
//            return nil
//        }
//        
//        return items.removeLast()
//    }
//}

// stackGenerator - associated type protocols - Iterator Protocol
struct StackGenerator<T>: IteratorProtocol {
    //typealias  Element = T - not actually needed
    
    var stack: Stack<T> // stack type ready to hold infomation of type T
    
    // function which changes stack by popping off last added and returning the type T
    mutating func next() -> T? {
        return stack.pop()
    }
}

// Element = placeholder, so we can use any type in this stack
struct Stack<Element>: Sequence {
    var items = [Element]()
    
    func makeIterator() -> StackGenerator<Element> {
        return StackGenerator(stack: self)
    }
    
    mutating func push(newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else {
            return nil
        }
        
        return items.removeLast()
    }
    
    // function takes a function that takes and element and returns and element, then the main function returns a stack of those elements
    func map<U>(f: (Element) -> U) -> Stack<U> {
        var mappedItems = [U]()
        
        for item in items {
            mappedItems.append(f(item))
        }
        
        return Stack<U>(items: mappedItems)
    }
    
    mutating func generate() -> StackGenerator<Element> {
        return StackGenerator(stack: self)
    }
}

var intStack = Stack<Int>()  // create new value type Stack

intStack.push(newItem: 1)
intStack.push(newItem: 2)

var doubledStack = intStack.map(f: { 2 * $0})
intStack.pop()
intStack.pop()
intStack.pop()  // returned nil so no value

// proving we can use any value:

var stringStack = Stack<String>()

stringStack.push(newItem: "String 1")
stringStack.push(newItem: "String 2")
print(stringStack.pop()!)   // because we return optional - safe in this case as we know it exists
stringStack.pop()
stringStack.pop()

// generic functions & methods - this method takes an array of stuff & a function, then returns an array of stuff - possibly transformed in some way

// function which has 2 placeholders, input and output placeholders
// function then takes and array of placeholder1 and a function which takes a single item from placehlder1 array 7 returns it transofrmed into placeholder 2, then the main function returns the placeholder2 data in an array
func myMap<T, U>(items: [T], f: (T) -> (U)) -> [U] {
    var result = [U]()
    
    for item in items {
        result.append(f(item))
    }
    return result
}

func convertStringToLength(item: String) -> Int {
    return item.characters.count
}

let strings = ["one", "two", "three"]

// using myMap and providing my own closure
let stringLengths = myMap(items: strings, f: {
    (string1: String) -> Int in
    return string1.characters.count
})

// alternative where we use the facts about inference:
// 1. the type we are putting in is a string
// 2. the type we are returning is an Int
// 3. we only want inputs character count and can use shorthand $0 to get it
let stringLengths2 = myMap(items: strings) { return $0.characters.count }

//print(stringLengths)
print(stringLengths2)


print(doubledStack.pop())
print(doubledStack.pop())

// type constraints, by consrtraining to a protocol, means only types conforming to that can be used

// equatable
func checkIfEqual<T: Equatable>(first: T, second: T) -> Bool {
    return first == second
}

print(checkIfEqual(first: 1, second: 1))
print(checkIfEqual(first: "a string", second: "a string"))
print(checkIfEqual(first: "a string", second: "another string"))

func checkIfDescriptionsMatch<T: CustomStringConvertible, U: CustomStringConvertible>(first: T, second: U) -> Bool {
    return first.description == second.description
}

print(checkIfDescriptionsMatch(first: Int(1), second: UInt(1)))
print(checkIfDescriptionsMatch(first: 1, second: 1.0))
print(checkIfDescriptionsMatch(first: Float(1.0), second: Double(1.0)))

// associated type protocols
var myStack3 = Stack<Int>()
myStack3.push(newItem: 10)
myStack3.push(newItem: 20)
myStack3.push(newItem: 30)

var myStackGenerator = StackGenerator(stack: myStack3)

while let value = myStackGenerator.next() {
    print("got \(value)")
}

// haha - it worked! - Iterator protocol (replaces whatever was used in Swift 2)
//for item in myStack3 {
//    print("\(item)")
//}

// type constraint where clauses
func pushItemsOntoStack<Element, S: Sequence>(stack: inout Stack<Element>, fromSequence sequence: S) where S.Iterator.Element == Element {
    for item in sequence {
        stack.push(newItem: item)
    }
}

pushItemsOntoStack(stack: &myStack3, fromSequence: [1, 2, 3])

for item in myStack3 {
    print("\(item)")
}

var myOtherStack = Stack<Int>()
pushItemsOntoStack(stack: &myOtherStack, fromSequence: [3,2,1])

pushItemsOntoStack(stack: &myStack3, fromSequence: myOtherStack)

print("--------")
for item in myStack3 {
    print("\(item)")
}