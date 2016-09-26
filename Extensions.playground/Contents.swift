//: Playground - noun: a place where people can play

import Cocoa

// type alias - simply make Velocity mean Double in all contexts from here on
typealias Velocity = Double

extension Velocity {
    var kph:  Velocity {
        return self * 1.60934   // turns mph into kph
    }
    
    var mph: Velocity {
        return self // exists by default as mph
    }
}

protocol VehicleType {
    var topSpeed: Velocity { get }
    var numberOfDoors: Int { get }
    var hasFlatbed: Bool { get }
}

struct Car {
    let numberOfDoors: Int  // Bronze 2nd challenge
    let make: String
    let model: String
    let year: Int
    let colour: String
    let nickname: String
    var gasLevel: Double {
        willSet {
            precondition(newValue <= 1.0 && newValue >= 0.0, "New value must be between 0 and 1")
        }
    }
}

extension Car: VehicleType {
    internal var hasFlatbed: Bool {
        return false
    }

    internal var topSpeed: Velocity {
        return 180
    }
}

extension Car {
    init(carMake: String, carModel: String, carYear: Int) {
        self.init(numberOfDoors: 4,
                  make: carMake,
                  model: carModel,
                  year: carYear,
                  colour: "Black",
                  nickname: "N/A",
                  gasLevel: 0.3)
    }
}

var myCar = Car(carMake: "Ford", carModel: "Fusion", carYear: 2013)

extension Car {
    enum CarKind: CustomStringConvertible {
        case Coupe, Sedan
        var description: String {
            switch self {
            case .Coupe:
                return "Coupe"
            case .Sedan:
                return "Sedan"
            }
        }
    }
    
    var kind: CarKind {
        if numberOfDoors == 2 {
            return .Coupe
        } else {
            return .Sedan
        }
    }
}

print(myCar.kind)

extension Car {
    mutating func emptyGas(amount: Double) {
        precondition(amount <= 1.0 && amount >= 0.0, "Amount to remove must be between 0 & 1")
        
        // silver challenge
        if amount > gasLevel {
            gasLevel = 0
        } else {
            gasLevel -= amount
        }
    }
    
    mutating func fillGas() {
        gasLevel = 1.0
    }
}

myCar.emptyGas(amount: 0.3)
print(myCar.gasLevel)
myCar.fillGas()
print(myCar.gasLevel)
myCar.emptyGas(amount: 0.3)
print(myCar.gasLevel)
myCar.emptyGas(amount: 0.5)
print(myCar.gasLevel)
myCar.emptyGas(amount: 0.4) // empties the tank rather than forcing an error in precondition trap
print(myCar.gasLevel)
extension Int {
    var timesFive: Int {
        return self * 5
    }
}

// bronze challenge
let myNumber: Int = 5
print(myNumber.timesFive)
