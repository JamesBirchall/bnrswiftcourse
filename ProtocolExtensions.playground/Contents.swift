//: Playground - noun: a place where people can play

import Cocoa

protocol ExerciseType: CustomStringConvertible {
    var name: String { get }
    var caloriesBurned: Double { get }
    var minutes: Double { get }
    var title: String { get }
}

struct EllipticalTrainer: ExerciseType {
    let name = "Elliptical Machine"
    let title = "Go Fast Elliptical Machine 3000"   // overwrites extension!
    let caloriesBurned: Double
    let minutes: Double
}

let ellipticalTrainer = EllipticalTrainer(caloriesBurned: 335, minutes: 30)

struct Treadmill: ExerciseType {
    let name = "Treadmill"
    let caloriesBurned: Double
    let minutes: Double
    let distanceInMiles: Double // additional variable for treadmill
}

let runningMachine = Treadmill(caloriesBurned: 350, minutes: 25, distanceInMiles: 4.2)

extension ExerciseType {
    // add a new function to this protocol
    var caloriesBurnedPerMinute: Double {
        return caloriesBurned / minutes
    }
    
    var title: String {
        return "\(name) - \(minutes) minutes"
    }
}

print(ellipticalTrainer.caloriesBurnedPerMinute)
print(runningMachine.caloriesBurnedPerMinute)

extension Sequence where Iterator.Element: ExerciseType {
    func totalCaloriesBurned() -> Double {
        var total: Double = 0
        for exercise in self {
            total = total + exercise.caloriesBurned
        }
        
        return total
    }
}

var myArray = ["Test", "Test2", "Test3"]

let mondayWorkout: [ExerciseType] = [ellipticalTrainer, runningMachine]
// monday workout doesn't have totalCaloriesBurned function in swift 3 :-(

extension ExerciseType {
    var description: String {
        return "Exercise \(name) , burned \(caloriesBurned) calories in \(minutes) minutes."
    }
}

// override the specific EXercisType Treadmill as extra info available
extension Treadmill {
    var description: String {
        return "Exercise \(name) , burned \(caloriesBurned) calories and \(distanceInMiles) miles in \(minutes) minutes."
    }
}

print(ellipticalTrainer)
print(runningMachine)

for exercise in mondayWorkout {
    print(exercise.title)
}

print(ellipticalTrainer.title)  // difference to the extension variable!

