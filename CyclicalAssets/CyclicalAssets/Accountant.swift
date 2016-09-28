//
//  Accountant.swift
//  CyclicalAssets
//
//  Created by James Birchall on 28/09/2016.
//  Copyright © 2016 James Birchall. All rights reserved.
//

import Foundation

class Accountant {
    // NetWorthChanged is actually a closure which takes a double and returns nothing
    typealias NetWorthChanged = (Double) -> ()
    
    var netWorthChangedHandler: NetWorthChanged? = nil
    
    var netWorth: Double = 0.0 {
        didSet {
            netWorthChangedHandler?(netWorth)
        }
    }
    
    func gainedNewAsset(asset: Asset) {
        netWorth = netWorth + asset.value
    }
    
    func remove(asset: Asset) {
        netWorth = netWorth - asset.value   // decrease netWorth as asset has gone!
    }
}
