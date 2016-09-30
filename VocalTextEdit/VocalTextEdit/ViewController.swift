//
//  ViewController.swift
//  VocalTextEdit
//
//  Created by James Birchall on 29/09/2016.
//  Copyright © 2016 James Birchall. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSSpeechSynthesizerDelegate {
    
    let speechSynthesiser = NSSpeechSynthesizer()

    @IBOutlet weak var textView: NSTextView!
    @IBOutlet weak var stopButton: NSButton!
    @IBOutlet weak var speakBUtton: NSButton!
    @IBOutlet weak var progressMeter: NSProgressIndicator!
    @IBOutlet weak var progressTextField: NSTextField!
    
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
            // silver challenge - not finished
            // hide the speak button until its finished
            speakBUtton.isEnabled = false
            stopButton.isEnabled = true
            
        } else {
            speechSynthesiser.startSpeaking("Please enter some words for me to speak.")
        }
    }
    
    @IBAction func stopButtonClicked(sender: NSButton) {
        if speechSynthesiser.isSpeaking {
            speechSynthesiser.stopSpeaking()
            // silver challenge
            speakBUtton.isEnabled = true
            stopButton.isEnabled = false
        }
    }
    
    // delegate call for view has loaded so we can disable stop button
    override func viewDidAppear() {
        stopButton.isEnabled = false
    }
    
    // delegate call for SPeechSynth to detect finishing speaking
    func speechSynthesizer(_ sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool) {
        // we want to enable the Speak button again and disable the Stop one
        speakBUtton.isEnabled = true
        stopButton.isEnabled = false
    }
}

