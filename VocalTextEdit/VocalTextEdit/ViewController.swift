//
//  ViewController.swift
//  VocalTextEdit
//
//  Created by James Birchall on 29/09/2016.
//  Copyright © 2016 James Birchall. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    let speechSynthesiser = NSSpeechSynthesizer()

    @IBOutlet var textView: NSTextView!
    
    var contents: String? {
        get {
            return textView.string
        }
        
        set {
            textView.string = newValue
        }
    }
    
    @IBAction func speakButtonClicked(sender: NSButton) {
        if let contents = textView.string , contents != "" {
            speechSynthesiser.startSpeaking(contents)
        } else {
            speechSynthesiser.startSpeaking("Please enter some words for me to speak.")
        }
    }
    
    @IBAction func stopButtonClicked(sender: NSButton) {
        if speechSynthesiser.isSpeaking {
            speechSynthesiser.stopSpeaking()
        }
    }
}

