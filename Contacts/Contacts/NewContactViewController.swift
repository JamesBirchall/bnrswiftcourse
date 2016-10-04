//
//  NewContactViewController.swift
//  Contacts
//
//  Created by James Birchall on 03/10/2016.
//  Copyright © 2016 James Birchall. All rights reserved.
//

import UIKit

class NewContactViewController: UIViewController {
    
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextFIeld: UITextField!
    
    @IBOutlet var contentImageView: UIImageView!
    

}

extension NewContactViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentImageView.image = NewDefaultImage.generate(of: (contentImageView.frame.size))
        
        print(contentImageView.frame.size);
    }
}
