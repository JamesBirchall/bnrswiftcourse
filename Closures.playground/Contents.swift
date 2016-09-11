//: Playground - noun: a place where people can play

import Cocoa

var volunteerCounts = [1,3,40,32,2,53,77,13]

// sort(_:) is a mthod which takes closure, that closer takes 2 vars of same type and returns a bool

//func sortDescending(i: Int, j: Int) -> Bool {
//    return i > j    // compare i to j, if less than return true (e.g leave in order)
//}
//
//let sortedVolunteers = volunteerCounts.sort(sortDescending)  // default it sort ascended, returns new array

// cleanup code for closures, make them inline
//let sortedVolunteers = volunteerCounts.sort({
//    (i: Int, j: Int) -> Bool in
//    return i > j
//})

// type inference, cleaning up further
//let sortedVolunteers = volunteerCounts.sort(
//    { i, j in i > j
//})

// finally - shorthand for arguments
//let sortedVolunteers = volunteerCounts.sort({
//    $0 > $1 // for each argument in sequence for the closures parameters it takes $2,$3... etc
//})

// also if the functions final argument (or only 1) then can remove the brackets as well!
let sortedVolunteers = volunteerCounts.sort {
    $0 > $1
}

// functions as return types
// function types frequenctly used to know what sort of closure you need

// function which takes nothing and returns a function that takes a tuple of 2 Int's and returns an Int
// think of condisions where you may wish to return different functions perhaps...
//func makeTownGrand() -> (Int, Int) -> Int {
//    func buildRoads(lightsToAdd: Int, toLights: Int) -> Int {
//        return toLights + lightsToAdd
//    }
//    
//    return buildRoads
//}

var stopLights = 3
//let townPlan = makeTownGrand()
//stopLights = townPlan(4, stopLights)
//print("Knowhere has \(stopLights) stoplights.")

// functions as arguments

func makeTownGrand(budget: Int, condition: Int -> Bool) -> ((Int, Int) -> Int)? {   // returns optional function!
    if condition(budget) {
        func buildRoads(lightsToAdd: Int, toLights: Int) -> Int {
            return toLights + lightsToAdd
        }
        
        return buildRoads
    } else {
        return nil
    }
}

// out closure for use inside makeTownGrand
func evaluateBudget(budget: Int) -> Bool {
    return budget >= 10000   // if equal or over 10k then we come back true
}

if let townPlan = makeTownGrand(10000, condition: evaluateBudget) { // budget sets possibility of making town bigger, also townPlan if set to function if makeTownGrand gets approval
    stopLights = townPlan(4, stopLights)
}
print("Knowhere has \(stopLights) stoplights.")

// Closures capture values

// function takes an Int and returns a function which takes nothing and returns an Int
func makeGrowthTracker(forGrowth growth: Int) -> () -> Int {
    var totalGrowth = 0
    
    // function we could return
    func growthTracker() -> Int {
        totalGrowth += growth
        print("Total size now: \(totalGrowth).")
        return totalGrowth
    }
    return growthTracker
}

var currentPopulation = 5422
let growBy500 = makeGrowthTracker(forGrowth: 500)
growBy500()    // this function now has a retained totalGrowth so always increments that by 500
growBy500()
growBy500()
currentPopulation = growBy500()

// closures are reference types  - setting constant or variable to point to that function
let anotherPopulationGrowBy500 = growBy500
anotherPopulationGrowBy500()    // still pointing to same function code.

var someOtherPopulation = 406123
let growBy10000 = makeGrowthTracker(forGrowth: 10000)
someOtherPopulation += growBy10000()
print(currentPopulation)    // remains unchanged as 10k function is a seperate set of code being run with 10k growth factor

// map function - a way to change each element in an array

let precinctPopulations = [1244, 2021, 2157]
let projectedPopulations = precinctPopulations.map({
    (population: Int) -> Int in
    return population * 2
})  // returns a new array
print(projectedPopulations) // each value transoformed by *2 in this case, maps lets you transform all values by specific way in the closure

// filter function - a way to filter to s subset of an array
let bigProjections = projectedPopulations.filter({
    (projections: Int) -> Bool in
    return projections > 4000
})
print(bigProjections)   // only returns subset as defined by the filter closure we created

//reduce function - with combine inside - aggregate array values in some way provided by closure
//let totalProjection = projectedPopulations.reduce(0){   // first is amount you may wish to start at then closure of how you want to deal with each element
//    (accumulatedProjecton: Int, precinctProjection: Int) -> Int in
//    return accumulatedProjecton + precinctProjection
//}
//print(totalProjection)  // total population

// gold challenge - shortening the reduce function
let totalProjection = projectedPopulations.reduce(0){ $0 + $1 } // shortest form of this closure
print(totalProjection)  // total population

