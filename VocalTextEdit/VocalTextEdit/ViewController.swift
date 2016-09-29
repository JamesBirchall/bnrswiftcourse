//
//  ViewController.swift
//  VocalTextEdit
//
//  Created by James Birchall on 29/09/2016.
//  Copyright © 2016 James Birchall. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var textView: NSTextView!
    
    @IBAction func speakButtonClicked(sender: NSButton) {
        print("I should speak \(textView.string)")
    }
    
    @IBAction func stopButtonClicked(sender: NSButton) {
        print("Stop button was clicked")
    }
}

