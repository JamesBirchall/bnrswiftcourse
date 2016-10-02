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
    
    // computed property to get saved data
    fileprivate let fileURL: URL = {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

        let url = documentsURL.appendingPathComponent("todolist.item").absoluteURL
        
        return url
    }()
    
    override init() {
        super.init()
        loadItems() // load on launching old list data
    }
    
    func addItem(item: String) {
        
        // check for simple space or no value before committing to the index
        // having said that we could do this visual side, not enable button
        // until we have a valid string?...
        if item.characters.count != 0 && item != " " {
            items.insert(item, at: 0)   // add to front of list
            saveItems() // update items file on disk
        }
    }
}

// we want this class to do the tableview delegate functions
extension ToDoList: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // setup a re-use pool to allow better usability performance
        //let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // silver challenge - control Cell Re-use from within the model/delegate class
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        // set to expected text value form items array
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func saveItems() {
        let itemsArray = items as NSArray   // bridging
        print("Saving items to \(fileURL)")
        
        if !itemsArray.write(to: fileURL, atomically: true) {
            print("Saving failed.")
        }
        
    }
    
    func loadItems() {
        if let itemsArray = NSArray(contentsOf: fileURL) as? [String]{
            items = itemsArray
            print("Items loaded from disk location \(fileURL)")
        } else {
            print("Loading failed.")
        }
    }
}

// xetension to deal with tableViewDelegate
extension ToDoList: UITableViewDelegate {
    
    @objc(tableView:commitEditingStyle:forRowAtIndexPath:) func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // remove item from items
            items.remove(at: indexPath.row)
            // remove from table View
            tableView.deleteRows(at: [indexPath], with: .automatic)
            saveItems()
        }
    }
}
