//
//  Vampire.swift
//  MonsterTown
//
//  Created by James Birchall on 18/09/2016.
//  Copyright © 2016 James Birchall. All rights reserved.
//

import Foundation

class Vampire: Monster {
    
    static var vampireHorde: [Vampire] = []    // will store vampires and be class available
    
    required init(town: Town?, monsterName: String) {
        super.init(town: town, monsterName: monsterName)
    }
    
    override func terrorizeTown() {
        // create a new vampire & decrement town population by 1
        if (town?.population)! >= 1 {
            town?.changePopulation(amount: -1)   // lose 10 population - swift 3 also means includng labels!
        } else {
            town?.changePopulation(amount: -(town?.population)!)   // lose 10 population - swift 3 also means includng labels!
        }
        
        let newVampire = Vampire(town: town, monsterName: "N/A")
        newVampire.name = "Vampire Agent\(Vampire.vampireHorde.count)"
        if let cloneTown = self.town {
            newVampire.town  = cloneTown
        }
        Vampire.vampireHorde.append(newVampire)
    }
}
