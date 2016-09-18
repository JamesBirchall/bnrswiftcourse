//
//  Mayor.swift
//  MonsterTown2
//
//  Created by James Birchall on 18/09/2016.
//  Copyright © 2016 James Birchall. All rights reserved.
//

import Foundation

struct Mayor {
    
    var name = "Jim"
    
    private var anxietyLevel = 0 {
        didSet(oldValue) {
            print("Mayor: I am loosing it even more...")
        }
    }
    
    static var speech = "I'm deeply saddened to hear about this latest tradgedy.  I promise my office is doing everything in its power to try and stop this esculating monster invasion."
    
    mutating func notifiedOfZombieAttack() {
        self.anxietyLevel += 1
    }
}
