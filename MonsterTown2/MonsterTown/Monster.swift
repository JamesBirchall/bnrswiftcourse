//
//  Monster.swift
//  MonsterTown
//
//  Created by James Birchall on 17/09/2016.
//  Copyright © 2016 James Birchall. All rights reserved.
//

import Foundation

class Monster {
    static let isMonsterTerrifying = true  // static variables cannot be overridden from subclasses
    var town: Town? // optional Town struct instance
    var name = "Monster"
    
    class var makeSpookyNoise: String {
        return "Grrr..."
    }
    
    var victimPool: Int {
        get {
            return town?.population ?? 0    // nil-coalescing operator to set to 0 if no town set
        }
        
        // setter means its a read/write property, set is called when assigned a value
        set {
            town?.population = newValue // newValue is a default option if not providing a named value after set(namedValue)
        }
    }
    
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town!")
        } else {
            print("\(name) has not found a town to terrorize.")
        }
    }
}
