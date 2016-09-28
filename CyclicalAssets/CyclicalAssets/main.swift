//
//  main.swift
//  CyclicalAssets
//
//  Created by James Birchall on 28/09/2016.
//  Copyright © 2016 James Birchall. All rights reserved.
//

import Foundation

var jim: Person? = Person(name: "Jim")  // because we need to set to nil, required to be var & optional!
var em: Person? = Person(name: "Em")
print("Created \(jim)")

var laptop: Asset? = Asset(name: "Laptop", value: 1000.00)
var hat: Asset? = Asset(name: "Hat", value: 140.00)
var backpack: Asset? = Asset(name: "Backpack", value: 37.00)

jim?.takeOwnershipOf(asset: laptop!)    // explicit unwrapping - we know it exists in this case
em?.takeOwnershipOf(asset: laptop!) // em trying to take same laptop!   -- should nil out

jim?.takeOwnershipOf(asset: hat!)   // explicit unwrapping - we know it exists in this case

jim?.removeOwnershipOf(asset: hat!) // no need for the hat!

print("While Jim is alive, hats owner is: \(hat?.owner)")
jim = nil
print("jim variable is now \(jim)")
print("While Jim is deallocated, hats owner is: \(hat?.owner)")   // explicit unwrap as we know!

laptop = nil
hat = nil
backpack = nil
