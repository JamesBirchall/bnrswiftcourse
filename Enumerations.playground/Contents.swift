//: Playground - noun: a place where people can play

import Cocoa

// enums are UpperCamelCase defined
enum TextAlignment {
    case Left
    case Right
    case Center
}

//var alignment: TextAlignment = TextAlignment.Left
// type inference version
var alignment = TextAlignment.Left
// infering the enum
alignment = .Right  // already had type set so can get a value from that type

if alignment == .Right {
    print("we should right-align the text!")
}

// switch statement - must cater for all enum cases possible
switch alignment {
case  TextAlignment.Left:
    print("left aligned")

case .Right:        // can shorten case as alignment is of type TextAlignment in same way
    print("right aligned")
    
case .Center:
    print("center aligned")
}

// avoid defaults with enums - future updates won't warn about new cases in a switch

// raw enum values
enum TextAlignment2: Int {
    case Left
    case Right
    case Center
    case Justify
}

var alignment2 = TextAlignment2.Justify

print("left value has \(TextAlignment2.Left.rawValue)")
print("right value has \(TextAlignment2.Right.rawValue)")
print("center value has \(TextAlignment2.Center.rawValue)")
print("justify value has \(TextAlignment2.Justify.rawValue)")
print("alignment2 value has \(alignment2.rawValue)")

// specifying raw values
enum TextAlignment3: Int {
    case Left = 20
    case Right = 30
    case Center = 40
    case Justify = 50
}

print("left value has \(TextAlignment3.Left.rawValue)")
print("right value has \(TextAlignment3.Right.rawValue)")
print("center value has \(TextAlignment3.Center.rawValue)")
print("justify value has \(TextAlignment3.Justify.rawValue)")

// converting raw values to a type
let myRawValue = 40 // center if remembered correctly

if let myAlignment = TextAlignment3(rawValue: myRawValue) {
    print("Successfully converted value '\(myAlignment)' into a TextALignment3!")
} else {
    print("Convertion to a TextALignment3failed for: '\(myRawValue)'")
}

// enum with strings
enum ProgrammingLanguages: String {
    case Swift = "Swift"
    case Cpp = "C++"
    case Objectivec = "Objective-C"
    case C = "C"
    case Java = "Java"
}

let myFavouriteProgrammingLanguage = ProgrammingLanguages.Objectivec
print("My favourite language is '\(myFavouriteProgrammingLanguage.rawValue)'!") // takes string representation

// can also use default name of the case if no value provided
enum ProgrammingLanguages2: String {
    case Swift
    case Cpp = "C++"
    case Objectivec = "Objective-C"
    case C
    case Java
}

let myFavouriteProgrammingLanguage2 = ProgrammingLanguages2.Swift
print("My favourite language is '\(myFavouriteProgrammingLanguage2.rawValue)'!")

// methods

enum Lighbulb {
    case On
    case Off
    
    func surfaceTempratureForAmbientTemprature(ambient: Double) -> Double {
        switch self {
        case .On:
            return ambient + 150.0
        default:
            return ambient
        }
    }
    
    // when modifying a structs state need to use mutating keyword on function to allow it
    mutating func toggle() {
        switch self{
        case .On:
            self = .Off
        case .Off:
            self = .On
            
        }
    }
}

var bulb = Lighbulb.On

let ambientTemperature = 77.0

var bulbTemperature = bulb.surfaceTempratureForAmbientTemprature(ambient: ambientTemperature)
switch bulb {
case .On:
    print("When on the bulb temperature is \(bulbTemperature).")
case .Off:
    print("When off the bulb temperature is \(bulbTemperature).")
}

bulb.toggle()
switch bulb {
case .On:
    print("When on the bulb temperature is \(bulbTemperature).")
case .Off:
    print("When off the bulb temperature is \(bulbTemperature).")
}

// asociated values - cases with associated values

enum shapeDimensions {  // should use lower camel case on structs now from swift 3.0
    case square(Double)
    
    case rectangle(width: Double, height: Double)
    
    case triangle(width: Double, height: Double)
    
    func area() -> Double {
        switch self {
        case let .square(side):
            return side * side
        case let .rectangle(width, height):
            return width * height
        case let .triangle(width, height):
            return (width * height) / 2
        }
    }
    
    func perimeter() -> Double? {
        // bronze challenge
        switch self {
        case let .square(side):
            return side * 4
        case let .rectangle(width, height):
            return (width * 2) + (height * 2)
        default:
            return nil
        }
    }
}

var squareShape = shapeDimensions.square(10.0)
var rectangleShape = shapeDimensions.rectangle(width: 12.0, height: 10.0)

print("Squares area = \(squareShape.area())")
print("Rectangles are = \(rectangleShape.area())")

// recursive enumerations - use indirect when recursive referencing so Swift nooes to treat memory model differently

indirect enum familyTree {
    case noKnownParents
    case oneKnownParent(name: String, ancestors: familyTree)
    case twoKnownParents(father: String, fatherAncestors: familyTree, mother: String, motherAncestor: familyTree)
}

let fredAncestors = familyTree.twoKnownParents(father: "Clive", fatherAncestors: .oneKnownParent(name: "Beth", ancestors: .noKnownParents), mother: "Sharon", motherAncestor: .noKnownParents)

// bronze evidence:
print("Squares perimeter = \(squareShape.perimeter())")
print("Rectangle perimeter = \(rectangleShape.perimeter())")

// silver challenge - adding triangle shape case    
var triangleShape = shapeDimensions.triangle(width: 4.0, height: 3.0)
print("Triangles area = \(triangleShape.area())")
if let trianglePerimeter = triangleShape.perimeter() {
    print("Triangles perimeter = \(trianglePerimeter)")
} else {
    print("Shape doesn't have correct perimeter calc built yet.")
}


