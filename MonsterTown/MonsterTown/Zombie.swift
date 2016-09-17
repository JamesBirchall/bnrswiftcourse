//
//  Zombie.swift
//  MonsterTown
//
//  Created by James Birchall on 17/09/2016.
//  Copyright © 2016 James Birchall. All rights reserved.
//

import Foundation

class Zombie: Monster { // class feature called inheritance
    var walksWithLimp = true
    
    // re-write a method on its super class of Monster
    // final keyword means inheriting this class you cannot override this function
    final override func terrorizeTown() {
        // optional chaining instead of unpacking an optional
        if (town?.population)! >= 10 {
            town?.changePopulation(amount: -10)   // lose 10 population - swift 3 also means includng labels!
        } else {
            town?.changePopulation(amount: -(town?.population)!)   // lose 10 population - swift 3 also means includng labels!
        }        
        
        super.terrorizeTown()   // call the function from super - could have done to beginning
    }
    
    func changeName(name: String, walksWithLimp: Bool) {
        self.name = name    // name is parameter in superclass
        self.walksWithLimp = walksWithLimp
    }
}
