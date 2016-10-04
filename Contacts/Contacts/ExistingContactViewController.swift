//
//  ExistingContactViewController.swift
//  Contacts
//
//  Created by James Birchall on 04/10/2016.
//  Copyright © 2016 James Birchall. All rights reserved.
//

import UIKit

class ExistingContactViewController: UIViewController {
    
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextFIeld: UITextField!
    @IBOutlet var contentImageView: UIImageView!
    
    // because we cannot set the UI stuff as its not existing yet!
    var firstName: String?
    var secondName: String?
    var locationInIndex: Int = 0
}

extension ExistingContactViewController {
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        contentImageView.image = NewDefaultImage.generate(of: (contentImageView.frame.size))
        
        print("Existing: \(contentImageView.frame.size)");
    }
    
    override func viewDidLoad() {
        // update the labels
        firstNameTextField.text = firstName!
        lastNameTextFIeld.text = secondName!
    }
}
