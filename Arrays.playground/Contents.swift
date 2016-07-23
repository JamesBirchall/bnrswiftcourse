//: Playground - noun: a place where people can play

import Cocoa

// var bucketList: Array<String>
// var buckList: [String]  // conventional way to declare an array, it is not yet initialised

// var bucketList: [String] = ["Climb Mt. Everest"]    // declaration and literal init
var bucketList = ["Climb Mt. Everest"]    // type inference

//bucketList.append("Fly hot air baloon to Fiji")
//bucketList.append("Watch the Lord of the Rings trilogy in a single day")
//bucketList.append("See the worlds largest whale")
//bucketList.append("Find treasure in the desert")
//bucketList.append("Scuba dive in the Great Blue Hole")
//bucketList.append("Make my first iOS app")

// using a array of items to then fill another array
var newItems = [
                "Fly hot air baloon to Fiji",
                "Watch the Lord of the Rings trilogy in a single day",
                "See the worlds largest whale",
                "Find treasure in the desert",
                "Scuba dive in the Great Blue Hole",
                "Make my first iOS app",
                ]
// get each element of the array and store into the existing string array
//for item in newItems {
//    bucketList.append(item)
//}

// shorthand for the above is to simply append one array onto another
bucketList += newItems

bucketList.removeAtIndex(2) // remove in a specific location

// inserting a new item
bucketList.insert("Canoe down the Amazon river", atIndex: 2)

for item in bucketList {
    print(item)
}

print("There are \(bucketList.count) things in your Bucket List!")

// bracket syntax
print(bucketList[0...2])    // print range from 0 index to 2 index location and in between

bucketList[2] += " in Australia"    // appends onto item[2] the string

bucketList[0] = "Climb Mt. Kilimanjaro"

for item in bucketList {
    print(item)
}

// to make an array == another array they must contain the same sequence of the same elements

var array1 = ["One", "Two", "Three"]
//var array2 = ["One", "Three", "Two"]
var array2 = ["One", "Two", "Three"]

let equal = (array1 == array2)

// using let instead of var can make an immutable array which can not change

var toDoList = ["Take out rubbish", "Pay Bills", "Go for run"]
print("There are \(toDoList.count) things in your to do list today.")

//for item in (0...toDoList.count - 1){
//    toDoList.insert(toDoList[toDoList.count - 1], atIndex: item)
//    toDoList.removeLast()   // remove last item that was copied and inserted
//}

// much faster way from documention
toDoList = toDoList.reverse()


print(toDoList)
