//: Playground - noun: a place where people can play

import Cocoa

var movieRatings = ["Donnie Darko" : 4, "Jaws" : 7, "Superman 2" : 6]

print("I have rated \(movieRatings.count) movies.")

let darkoRating = movieRatings["Donnie Darko"]  // returns optional 

movieRatings["Jaws"] = 9

movieRatings

let oldRating: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")
if let lastRating = oldRating, currentRating = movieRatings["Donnie Darko"]{
    print("Old rating: \(lastRating); current rating: \(currentRating)")
}

movieRatings["Gremlins"] = 5
//
//movieRatings.removeValueForKey("Superman 2")
//movieRatings
//movieRatings["Jaws"] = nil // similar to above but doesn't return keys value
//movieRatings

// looping through a dictionary
for (key, value) in movieRatings {
    print("The movie \(key) was rated with \(value) out of 10")
}

// if just want one part of dictionary

for movie in movieRatings.keys {
    print("User has rated \(movie).")
}

// use let to make an immutable dictionary - similar to arrays

// sending keys and value into an arra
let watchedMovies = Array(movieRatings.keys)
let watchedRatings = Array(movieRatings.values)
// latter only makes sense with former to context

let dorsetPostcodes = ["BH11", "DT11", "DT12"]    //array
let londonPostcodes = ["SW15", "SW16", "SW18"]
let midlandsPostcodes = ["WS3", "WS4", "WS6"]

let englandPostcodes = ["dorset postcodes" : dorsetPostcodes, "london postcodes" : londonPostcodes, "midlands postcodes" : midlandsPostcodes]   //dictionary

// to get just values into a single array, append one array at a time
var postcodes: [String]  = []   // empty array
for values in englandPostcodes.values{
    postcodes += Array(values)
}

print("England has the following postcodes: \(postcodes)")
