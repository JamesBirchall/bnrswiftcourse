//
//  main.swift
//  MonsterTown
//
//  Created by James Birchall on 17/09/2016.
//  Copyright © 2016 James Birchall. All rights reserved.
//

import Foundation

var myTown = Town() // struct gets init here - a default one
myTown.changePopulation(amount: -1)
myTown.townName = "Somewheresville"
//myTown.printDescription()
//
//let gm = Monster()
//gm.town = myTown
//gm.terrorizeTown()

let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.changeName(name: "Fred", walksWithLimp: true)
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printDescription()  // optional chaining again
