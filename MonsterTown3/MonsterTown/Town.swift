//
//  Town.swift
//  MonsterTown
//
//  Created by James Birchall on 17/09/2016.
//  Copyright © 2016 James Birchall. All rights reserved.
//

import Foundation

struct Town {
    // type properties - shared across all instances of this type
    let region: String
    
    var mayor: Mayor?
    
    var population: Int {
        
        // property observer - after property has changed
        didSet(oldPopulation) {
            if oldPopulation > population{
                print("The population has gone down, changed to \(population) from \(oldPopulation)")
                print(Mayor.speech)
            }
        }
        
        willSet(newValue) {
            // property observer - before the value is set
            if population > newValue {
                print("The population is about to go down, changed from \(population) to \(newValue)")
            }
        }
        
    }
    var numberOfStopLights: Int
    var townName: String?
    
    // nested types cannot be accessed outside this class
    enum size {
        case Small
        case Medium
        case Large
    }
    
    // lazy variable (only variables not let) - doesn't get set until first used
    // not great if things change during objects lifetime, its set once called
//    lazy var townSize: size = {
//        switch self.population {
//        case 0...10000:
//            return size.Small
//        case 10001...100000:
//            return size.Medium
//        default:
//            return size.Large
//        }
//    }() //this is a closure so need it to run by adding the () after, else it would simply assign this closure and not run it
    
    // Computed property
    var townSize: size {
        // getter is called every time you want to use the value
        // on its own also mean townSize is a read only class property in this instance
        get {
            switch self.population {
            case 0...10000:
                return size.Small
            case 10001...100000:
                return size.Medium
            default:
                return size.Large
            }
        }
    }
    
    // memberwise init - ? makes it a failable initalizer
    init?(region: String, mayor: Mayor?, population: Int, numberOfStopLights: Int, townName: String?) {
        if population <= 0 {
            return nil
        }
        self.region = region
        self.mayor? = mayor!
        self.population = population
        self.numberOfStopLights = numberOfStopLights
        self.townName? = townName!
    }
    
    init?( population: Int, stoplights: Int) {
        self.init(region: "N/A", mayor: nil, population: population, numberOfStopLights: stoplights, townName: "N/A")
    }
    
    func printDescription() {
        if let townName = self.townName {   // unpack to display name in next string
            print("\(townName) - Population \(population), Number of Stop Lights: \(numberOfStopLights), in the \(region).")
        } else {
            print("Population \(population), Number of Stop Lights: \(numberOfStopLights), in the \(region).")
        }
        
    }
    
    // similar to enums, use mutating to change that struct instances parameters
    mutating func changePopulation(amount: Int) {
        population += amount
    }
}
