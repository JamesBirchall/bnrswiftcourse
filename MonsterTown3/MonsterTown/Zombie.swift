//
//  Zombie.swift
//  MonsterTown
//
//  Created by James Birchall on 17/09/2016.
//  Copyright © 2016 James Birchall. All rights reserved.
//

import Foundation

class Zombie: Monster { // class feature called inheritance
    var walksWithLimp: Bool
    
    private(set) var isFallingApart: Bool   // others can read but not set the value
    
    init?(limp: Bool, fallingApart: Bool, town: Town?, monsterName: String) {
        walksWithLimp = limp
        isFallingApart = fallingApart
        super.init(town: town, monsterName: monsterName)
    }
    
    convenience init?(limp: Bool, fallingApart: Bool) {
        self.init(limp: limp, fallingApart: fallingApart, town: nil, monsterName: "Fred")
        
        if limp {
            print("This zombie has a limp.")
        }
    }
    
    // from the super class - required to implement and use the required keyword!
    // made convinience by setting to convinience and setting defaults in the self.init
    convenience required init?(town: Town?, monsterName: String) {
        self.init(limp: false, fallingApart: false, town: town, monsterName: monsterName)
    }
    
    // re-write a method on its super class of Monster
    // final keyword means inheriting this class you cannot override this function
    final override func terrorizeTown() {
        // optional chaining instead of unpacking an optional
        if !isFallingApart && town != nil {
            if (town?.population)! >= 10 {
                town?.changePopulation(amount: -10)   // lose 10 population - swift 3 also means includng labels!
                town?.mayor?.notifiedOfZombieAttack()   // been noified of attack
            } else {
                town?.changePopulation(amount: -(town?.population)!)   // lose 10 population - swift 3 also means includng labels!
                town?.mayor?.notifiedOfZombieAttack()   // been noified of attack
            }
        }
        
        super.terrorizeTown()   // call the function from super - could have done to beginning
    }
    
    deinit {
        print("Zombie named \(name) is no longer with us.")
    }
    
    func changeName(name: String, walksWithLimp: Bool) {
        self.name = name    // name is parameter in superclass
        self.walksWithLimp = walksWithLimp
    }
    
    override class var makeSpookyNoise: String {
        return "Brains..."
    }
}
