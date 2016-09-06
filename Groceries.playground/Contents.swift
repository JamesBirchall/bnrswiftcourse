//: Playground - noun: a place where people can play

import Cocoa

var groceryBag = Set<String>() // creating a Mutable Set holding instances of strings

groceryBag.insert("Apples")
groceryBag.insert("Bananas")
groceryBag.insert("Tin of Beans")

// loop through a set, similar to arrays
//for food in groceryBag {
//    print(food)
//}

// creating a set with known values at time - init with an array
var otherGroceryBag = Set(["Apples", "Bananas", "Tin of Beans"])
// optionally var otherGroceryBag: Set = ["Apples", "Bananas", "Tin of Beans"]

// loop through a set, similar to arrays
//for food in otherGroceryBag {
//    print(food)
//}

let hasBanana = groceryBag.contains("Bananas")  // contains comparitor

let friendsGroceryBag = Set(["Bananas","Cereal","Milk","Apples"])

// unions - merges sets
let commonGroceryBag = groceryBag.union(friendsGroceryBag)

//for food in commonGroceryBag {
//    print(food)
//}

let roomMatesBag = Set(["Apples","Bananas","Cereal","Toothpaste"])

// intersect - return common items between 2 sets
let itemsToReturn = commonGroceryBag.intersect(roomMatesBag)

let yourSecondBag = Set(["Berries","Yoghurt"])
let roomMatesSecondBag = Set(["Grapes","Honey"])

// is disjoint to another set - true if no clashes
let disjoint = yourSecondBag.isDisjointWith(roomMatesBag)

// silver challenge
let myCities = Set(["Atlanta","Chicago","Jacksonville", "New York", "San Francisco"])
let yourCities = Set(["Chicago","San Francisco","Jacksonville"])

let containsAllOfYours = myCities.isSupersetOf(yourCities)

// silver challenge 2

let friendsGroceryBagTwo = Set(["Bananas","Cereal","Milk","Apples"])

// unions - merges sets on existing set
groceryBag.unionInPlace(friendsGroceryBagTwo)

for food in groceryBag {
    print(food)
}

groceryBag.intersectInPlace(roomMatesBag)   // edits existing set