//
//  Contacts.swift
//  Contacts
//
//  Created by James Birchall on 03/10/2016.
//  Copyright © 2016 James Birchall. All rights reserved.
//

import Foundation

class Contact: NSObject {
    let firstName: String
    let secondName: String
    
    init(firstName: String, secondName: String) {
        self.firstName = firstName
        self.secondName = secondName
        
        super.init()
    }
}
