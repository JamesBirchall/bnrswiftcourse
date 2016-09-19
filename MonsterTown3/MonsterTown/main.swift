//
//  main.swift
//  MonsterTown
//
//  Created by James Birchall on 17/09/2016.
//  Copyright © 2016 James Birchall. All rights reserved.
//

import Foundation

// setup using memberwise initaliser - given for free my the struct/class along with defauly empty init
var myTown = Town(region: "South", mayor: nil, population: 10000, numberOfStopLights: 6, townName: "Jimville")
myTown?.printDescription()

var myTown2 = Town(population: -3, stoplights: 3)
if myTown2 != nil {
    myTown2?.printDescription()
} else {
    print("2nd town init failed...")
}

//let fredTheZombie = Zombie(limp: false, fallingApart: false, town: myTown2, monsterName: "Fred")
var fredTheZombie: Zombie? = Zombie(limp: true, fallingApart: false)
fredTheZombie?.town = myTown2
fredTheZombie?.terrorizeTown()

fredTheZombie = nil // forces a deinit - only optional types can become nil remember!

let namelessMonster = Zombie(town: myTown, monsterName: "")
if namelessMonster != nil {
    print("\(namelessMonster?.name) is unleashed!")
} else {
    print("namelessMonster init failed and return nil!")
}

//let myVampire = Vampire(town: myTown2, monsterName: "BigVamps")
//myVampire.terrorizeTown()
//myVampire.terrorizeTown()
//myVampire.terrorizeTown()
//myVampire.terrorizeTown()
//print(Vampire.vampireHorde.count)

//var myTown = Town() // struct gets init here - a default one
//
//var myMayor = Mayor()
//
//myTown.mayor = myMayor
//print("Mayor appointed, please welcome \(myMayor.name)")
//
//let townSize = myTown.townSize
//
//myTown.changePopulation(amount: 1000000)
//
//print("Size: \(myTown.townSize) with Population: \(myTown.population)") 
//
//myTown.changePopulation(amount: 10)
//myTown.townName = "Spooksville"
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
//fredTheZombie.terrorizeTown()
//print("Victim Pool: \(fredTheZombie.victimPool)")
//fredTheZombie.victimPool = 500  // changes towns population to match new victim pool
//print("Victim Pool: \(fredTheZombie.victimPool)")
//
//print(Zombie.makeSpookyNoise) // type method
//
//let masterVampire = Vampire()
//masterVampire.name = "Master Vampire"
//masterVampire.town = myTown
//
//masterVampire.terrorizeTown()
//masterVampire.terrorizeTown()
//masterVampire.terrorizeTown()
//masterVampire.terrorizeTown()
//masterVampire.terrorizeTown()
//masterVampire.town?.printDescription()

// prove that the static vampire horde is global to the Vampire class
//for vamp in Vampire.vampireHorde {
//    print("\(vamp.name)")
//}

//print(Vampire.makeSpookyNoise)
//
//if Vampire.isMonsterTerrifying {
//    print("Running away from terrifying vampire!")
//}
