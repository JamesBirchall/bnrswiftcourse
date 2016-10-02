//
//  ToDoList.swift
//  iTahDoodle
//
//  Created by James Birchall on 02/10/2016.
//  Copyright © 2016 James Birchall. All rights reserved.
//

import UIKit

class ToDoList: NSObject {
    
    fileprivate var items: [String] = []    // setup and initailise empty - fileprivate allows use in code file only
    
    func addItem(item: String) {
        
        // check for simple space or no value before committing to the index
        // having said that we could do this visual side, not enable button
        // until we have a valid string?...
        if item.characters.count != 0 && item != " " {
            items.insert(item, at: 0)   // add to front of list
        }
    }
}

// we want this class to do the tableview delegate functions
extension ToDoList: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // setup a re-use pool to allow better usability performance
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // set to expected text value form items array
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
}
