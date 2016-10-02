//
//  ViewController.swift
//  iTahDoodle
//
//  Created by James Birchall on 02/10/2016.
//  Copyright © 2016 James Birchall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let toDoList = ToDoList()
    
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var todoTableView: UITableView!

    @IBAction func insertItem() {
        guard let text = itemTextField.text else {
            return
        }
        toDoList.addItem(item: text)
        
        todoTableView.reloadData()  // refresh data after adding to items array
        
        // silver challange part 1 - clear box
        itemTextField.text = ""
    }
    
    // setup the tableView properly after loading views
    override func viewDidLoad() {
        todoTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        todoTableView.dataSource = toDoList
    }
}

extension ViewController {
    
    
}
