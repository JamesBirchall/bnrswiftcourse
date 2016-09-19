//: Playground - noun: a place where people can play

import Cocoa

//func printTable(data: [[Int]]) {
//    
//    for row in data {
//        // create empty string
//        var out = " "
//        
//        // append each item in this row to a string
//        for item in row {
//            out += "\(item) |"
//        }
//        
//        print(out)
//    }
//}

// row label version of print
func printTable(rowLabels: [String], data: [[Int]]) {
    
    let rowLabelWidths = rowLabels.map { $0.characters.count }
    
    guard let maxRowLabelWidth = rowLabelWidths.max() else {
        return
    }
    
    for (i, row) in data.enumerated() {
        let paddingAmount = maxRowLabelWidth - rowLabelWidths[i]
        var out = rowLabels[i] + padding(amount: paddingAmount)
        
        for item in row {
            out += " \(item) |"
        }
        print(out)
    }
    
}

func padding(amount: Int) -> String {
    var paddingString = ""
    
    for _ in 0 ..< amount {
        paddingString += " "
    }
    return paddingString
}

let rowLabels = ["Jim", "Emily", "Tom"]
let labelColumns = ["Age", "Years of Stuff"]

let data = [
    [30, 6],
    [40, 18],
    [50, 20],
]

printTable(rowLabels: rowLabels, data: data)