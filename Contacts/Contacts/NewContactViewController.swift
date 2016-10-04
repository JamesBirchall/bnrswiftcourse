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
    
    
// - Book code - this is wrong as we won't have constraints set yet so taking
//   the image.frame.size would give us just an unknown
// see - http://stackoverflow.com/questions/29675128/objective-c-swift-ios-when-are-the-auto-constraints-applied-in-the-view-viewco
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        contentImageView.image = NewDefaultImage.generate(of: (contentImageView.frame.size))
//        
//        print(contentImageView.frame.size);
//    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    
        contentImageView.image = NewDefaultImage.generate(of: (contentImageView.frame.size))
        
        print(contentImageView.frame.size);
    }
}


