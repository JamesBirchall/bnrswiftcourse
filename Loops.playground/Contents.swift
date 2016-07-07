//: Playground - noun: a place where people can play

import Cocoa

var myFirstInt: Int = 0

// type interfernce means i is Int
for i in 1...5 {
    myFirstInt += 1
    //print(myFirstInt)
    print("myFirstInt equals \(myFirstInt) at iteration \(i)")
}

myFirstInt = 0

for _ in 1...5 {
    myFirstInt += 1
    //print(myFirstInt)
    print("myFirstInt equals \(myFirstInt)")
}

// prints every divisible by 3 value
// i is scope of this only and range for it is 1...100
// for case loop
for case let i in 1...100 where i % 3 == 0 {
    print(i)
}

// classic loops don't exist anymore!
myFirstInt = 0
// while loop
var i = 1
while i < 6 {
    myFirstInt += 1
    print(myFirstInt)
    i += 1
}



// challenge code

for _ in 1...5 {
    for case let i in 0...100 where i % 2 == 0 || i == 0 {
        print(i)
    }
    print("And again...")
}


// end of challenge code


var blastersOverheating = false
var blasterFireCount = 0
var shields = 5
var spaceDemonDestroyed = 0




// classic do while but repeat while
repeat {

    if spaceDemonDestroyed == 500 {
        print("You beat the game!")
        break //exits the loop completely
    }
    
    if blastersOverheating {
        print("BLasters overheating!")
        sleep(5)
        print("Blasters ready to fire...")
        sleep(1)
        blastersOverheating = false
        blasterFireCount = 0
    }
    
    if blasterFireCount > 100 {
        blastersOverheating = true
        continue    // use to return to top of loop
    }
    
    print("Fire blasters!")
    blasterFireCount += 1
    spaceDemonDestroyed += 1
    
} while shields > 0