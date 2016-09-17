//
//  Town.swift
//  MonsterTown
//
//  Created by James Birchall on 17/09/2016.
//  Copyright © 2016 James Birchall. All rights reserved.
//

import Foundation

struct Town {
    var population = 10
    var numberOfStopLights = 4
    var townName: String?
    
    func printDescription() {
        if let townName = self.townName {   // unpack to display name in next string
            print("\(townName) - Population \(population), Number of Stop Lights: \(numberOfStopLights).")
        } else {
            print("Population \(population), Number of Stop Lights: \(numberOfStopLights).")
        }
        
    }
    
    // similar to enums, use mutating to change that struct instances parameters
    mutating func changePopulation(amount: Int) {
        population += amount
    }
}
