//
//  Contacts.swift
//  Contacts
//
//  Created by James Birchall on 03/10/2016.
//  Copyright © 2016 James Birchall. All rights reserved.
//

import Foundation

class Contact: NSObject {
    let name: String
    
    init(contactName: String) {
        name = contactName
        super.init()
    }
}
