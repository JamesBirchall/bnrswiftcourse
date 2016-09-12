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
}

var bulb = Lighbulb.On

let ambientTemperature = 77.0

var bulbTemperature = bulb.surfaceTempratureForAmbientTemprature(ambientTemperature)
switch bulb {
case .On:
    print("When on the bulb temperature is \(bulbTemperature).")
case .Off:
    print("When off the bulb temperature is \(bulbTemperature).")
}




