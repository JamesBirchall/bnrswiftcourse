//
//  Asset.swift
//  CyclicalAssets
//
//  Created by James Birchall on 28/09/2016.
//  Copyright © 2016 James Birchall. All rights reserved.
//

import Foundation

class Asset: CustomStringConvertible {
    
    let name: String
    let value: Double
    
    // weak needed to break strong reference cycle (retain cycles)
    // weak refs must always be var & optional!
    weak var owner: Person?  // optional, may not have an owner
    
    var description: String {
        if let actualOwner = owner {
            return "Asset(\(name)), worth \(value), owned by \(actualOwner)."
        } else {
            return "Asset(\(name)), worth \(value), no owner."
        }
    }
    
    init(name: String, value: Double) {
        self.name = name
        self.value = value
    }
    
    deinit {
        print("\(self) is being deacllocated.")
    }
}
