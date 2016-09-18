//
//  main.swift
//  MonsterTown
//
//  Created by James Birchall on 17/09/2016.
//  Copyright © 2016 James Birchall. All rights reserved.
//

import Foundation

var myTown = Town() // struct gets init here - a default one
//myTown.changePopulation(amount: 10)
myTown.townName = "Spooksville"
//myTown.printDescription()
//
//let gm = Monster()
//gm.town = myTown
//gm.terrorizeTown()
//
//let fredTheZombie = Zombie()
//fredTheZombie.town = myTown
//fredTheZombie.changeName(name: "Fred", walksWithLimp: true)
//fredTheZombie.terrorizeTown()
//fredTheZombie.town?.printDescription()  // optional chaining again

let masterVampire = Vampire()
masterVampire.name = "Master Vampire"
masterVampire.town = myTown

masterVampire.terrorizeTown()
masterVampire.terrorizeTown()
masterVampire.terrorizeTown()
masterVampire.terrorizeTown()
masterVampire.terrorizeTown()
masterVampire.town?.printDescription()

// prove that the static vampire horde is global to the Vampire class
for vamp in Vampire.vampireHorde {
    print("\(vamp.name)")
}

