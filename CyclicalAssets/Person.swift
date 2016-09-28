//
//  Person.swift
//  CyclicalAssets
//
//  Created by James Birchall on 28/09/2016.
//  Copyright © 2016 James Birchall. All rights reserved.
//

import Foundation

// Protocol allows replacement of self reference to return description func String
class Person: CustomStringConvertible {
    let name: String
    let accountant = Accountant()
    var assets = [Asset]()  // init as array of Asset class

    // for protocol conformance
    var description: String {
        return "Person(\(name))"
    }
    
    init(name: String) {
        self.name = name
        
        accountant.netWorthChangedHandler = {
            // [weak self] and optional self chaining to remove strong reference cycle
            [weak self] (netWorth: Double) in self?.netWorthDidChange(netWorth: netWorth)
            return
        }
    }
    
    deinit {
        print("\(self) is being deallocated.")
    }
    
    func takeOwnershipOf(asset: Asset) {
        if asset.owner?.name == nil {
            asset.owner = self  // set asset owner to this class instance
            assets.append(asset)    // add to this class instances owned assets
            accountant.gainedNewAsset(asset: asset)
        } else {
            print("Asset owned already by \(asset.owner!.name), they had better give it up first.")
        }
    }
    
    func removeOwnershipOf(asset: Asset) {
        if asset.owner?.name == self.name {
            asset.owner = nil   // remove assets owner
            assets = assets.filter { $0.name != asset.name }    // remove asset from Owner assets array
            accountant.remove(asset: asset) // remove netWorth value of asset
        }
    }
    
    func netWorthDidChange(netWorth: Double) {
        print("The net worth of \(self) is \(netWorth)")
    }
}
