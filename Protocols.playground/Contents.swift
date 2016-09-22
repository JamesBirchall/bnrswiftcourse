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
//func printTable(rowLabels: [String], data: [[Int]]) {
//    
//    let rowLabelWidths = rowLabels.map { $0.characters.count }
//    
//    guard let maxRowLabelWidth = rowLabelWidths.max() else {
//        return
//    }
//    
//    
//    
//    for (i, row) in data.enumerated() {
//        let paddingAmount = maxRowLabelWidth - rowLabelWidths[i]
//        var out = rowLabels[i] + padding(amount: paddingAmount)
//        
//        for item in row {
//            out += " \(item) |"
//        }
//        print(out)
//    }
//    
//}

// column labels version
//func printTable(rowLabels: [String], columns: [String], data: [[Int]]) {
//    
//    let rowLabelWidths = rowLabels.map { $0.characters.count }
//    
//    guard let maxRowLabelWidth = rowLabelWidths.max() else {
//        return
//    }
//    
//    var firstRow: String = padding(amount: maxRowLabelWidth) + " |"
//    
//    var columnWidths = [Int]()
//    
//    for columnLabel in columns {
//        let columnHeader = " \(columnLabel) |"
//        firstRow += columnHeader
//        columnWidths.append(columnHeader.characters.count)
//    }
//    print(firstRow)
//    
//    // print(columnWidths)
//    
//    for (i, row) in data.enumerated() {
//        let paddingAmount = maxRowLabelWidth - rowLabelWidths[i]
//        var out = rowLabels[i] + padding(amount: paddingAmount) + " |"
//        
//        for (j, item) in row.enumerated() {
//            let itemString = " \(item) |"
//            let paddingAmount = columnWidths[j] - itemString.characters.count
//            out += padding(amount: paddingAmount) + itemString
//        }
//        
//        print(out)
//    }
//    
//}
//
func padding(amount: Int) -> String {
    var paddingString = ""
    
    for _ in 0 ..< amount {
        paddingString += " "
    }
    return paddingString
}

//let rowLabels = ["Jim", "Emily", "Tom"]
//let labelColumns = ["Age", "Years of Stuff"]
//
//let data = [
//    [30, 6],
//    [40, 18],
//    [50, 20],
//]

//printTable(rowLabels: rowLabels, columns: labelColumns, data: data)

protocol TabularDataSource {
    var numberOfRows: Int { get }   // get means it must be at least read only
    var numberOfColumns: Int { get }
    
    func labelForRow(row: Int) -> String    // provide function call and return type only
    func labelForColumn(column: Int) -> String
    
    func itemForRow(row: Int, column: Int) -> Int
    
}

struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Department: TabularDataSource, CustomStringConvertible {

    let name: String
    var people = [Person]()
    
    init(name: String) {
        self.name = name
    }
    
    mutating func addPerson(person: Person) {
        people.append(person)
    }
    
    var numberOfRows: Int {
        return people.count // number of rows needed (total [Person])
    }

    var numberOfColumns: Int {
        return 2 // hardcoded to number of columns being used
    }
    
    func labelForRow(row: Int) -> String {
        return people[row].name // return persons name string
    }
    
    func labelForColumn(column: Int) -> String {
        switch column {
        case 0:
            return "Age"
        case 1:
            return "Years of Experience"
        default:
            exit(1) // crash
        }
    }
    
    func itemForRow(row: Int, column: Int) -> Int {
        let person = people[row]
        
        switch column {
        case 0:
            return person.age
        case 1:
            return person.yearsOfExperience
        default:
            exit(1) // crash
        }
        
    }
    
    // custom string convertable protocol variable
    var description: String {
        return "\(name) Department"
    }
}

var department = Department(name: "Engineering")

department.addPerson(person: Person(name: "Jim", age: 2009, yearsOfExperience: 10))
department.addPerson(person: Person(name: "Em", age: 30, yearsOfExperience: 13))
department.addPerson(person: Person(name: "Tom", age: 23, yearsOfExperience: 49))
department.addPerson(person: Person(name: "Someone", age: 12345, yearsOfExperience: 49))

// protocol conform version - protocol composition is now protocol & protocol...
func printTable(dataSource: TabularDataSource & CustomStringConvertible) {
    
    print("Table: \(dataSource.description) \n")

    // create array of the row and column labels
    let rowLabels = (0 ..< dataSource.numberOfRows).map { dataSource.labelForRow(row: $0) }
    
    let columnLabels = (0 ..< dataSource.numberOfColumns).map { dataSource.labelForColumn(column: $0) }
    
    let rowLabelWidths = rowLabels.map { $0.characters.count }

    guard let maxRowLabelWidth = rowLabelWidths.max() else {
        return
    }

    var firstRow: String = padding(amount: maxRowLabelWidth) + " |"

    var columnWidths = [Int]()

    // work out header sizes first
    for columnLabel in columnLabels {
        let columnHeader = " \(columnLabel) |"
        columnWidths.append(columnHeader.characters.count)
    }
    
    // now work out data column max sizes
    var columnWidths2 = [Int]() // used to store max widths of all data
    
    for i in 0 ..< dataSource.numberOfColumns {
        var maxValue = 0
        for j in 0 ..< dataSource.numberOfRows {
            //print("\(dataSource.itemForRow(row: j, column: i))")
            
            if String(dataSource.itemForRow(row: j, column: i)).characters.count + 3 > maxValue {
                maxValue = String(dataSource.itemForRow(row: j, column: i)).characters.count + 3 // padding and |
            }
        }
        columnWidths2.append(maxValue)
        maxValue = 0
    }
    
    
    // compare columnWidths and choose highest ones from header vs data - always correct table size!
    var finalColumnWidths = [Int]()
    for i in 0 ..< columnWidths.count {
        finalColumnWidths.append(max(columnWidths[i], columnWidths2[i]))
    }
    
    // now setup header properly before printing
    for i in 0 ..< columnLabels.count {
        let columnHeader = " \(columnLabels[i]) |"
        let paddingAmount = finalColumnWidths[i] - columnHeader.characters.count
        firstRow += padding(amount: paddingAmount) + columnHeader
    }
    
    // print the header first
    print(firstRow)
    
    // and finally print the data rows
    for i in 0 ..< dataSource.numberOfRows {
        let paddingAmount = maxRowLabelWidth - rowLabelWidths[i]
        var out = rowLabels[i] + padding(amount: paddingAmount) + " |"
        
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemForRow(row: i, column: j)
            let itemString = " \(item) |"
            let paddingAmount = finalColumnWidths[j] - itemString.characters.count
            out += padding(amount: paddingAmount) + itemString
        }

        print(out)
    }

}

printTable(dataSource: department)
//print(department)   // will check for protocol CustomStringConvertable

// classes must define superclass before any protocols


