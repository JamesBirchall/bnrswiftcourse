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
    
    var wordsPerSecond: Int?
    
    var wordsReadUpTo: Int = 1
    
    var contents: String? {
        get {
            return textView.string
        }
        
        set {
            textView.string = newValue
        }
    }
    
    @IBAction func speakButtonClicked(sender: NSButton) {
        speechSynthesiser.delegate = self
        
        // unhide elements
        progressMeter.isHidden = false
        progressTextField.isHidden = false
        
        print("Speak button pressed")
        if let contents = textView.string , contents != "" {
            
            wordsReadUpTo = 0
            // reset progress meter
            progressMeter.increment(by: -(progressMeter.maxValue))
            
            wordsPerSecond = Int(speechSynthesiser.rate) / 60    // words per minute rate of speaking
            
            if let totalWords = numberOfWords() {
                let totalEstimatedTime = wordsPerSecond! * totalWords
                
                // progress meter settings
                progressMeter.maxValue = Double(totalEstimatedTime)
            }
            
            progressMeter.startAnimation(nil)
            // Start Audio now as well
            speechSynthesiser.startSpeaking(contents)
            // silver challenge - not finished
            // hide the speak button until its finished
            speakBUtton.isEnabled = false
            stopButton.isEnabled = true
        } else {
            speechSynthesiser.startSpeaking("Please enter some words for me to speak.")
            speakBUtton.isEnabled = true
            stopButton.isEnabled = false
        }
    }
    
    @IBAction func stopButtonClicked(sender: NSButton) {
        speechSynthesiser.stopSpeaking()
        speakBUtton.isEnabled = true
        stopButton.isEnabled = false
        progressMeter.stopAnimation(nil)
        // hide progress meter again
        progressMeter.isHidden = true
        progressTextField.isHidden = true
    }
    
    // delegate call for view has loaded so we can disable stop button
    override func viewDidAppear() {
        stopButton.isEnabled = false
    }
    
    // delegate call for SPeechSynth to detect finishing speaking
    
    func speechSynthesizer(_ sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool) {
        // we want to enable the Speak button again and disable the Stop one
        if finishedSpeaking {
            speakBUtton.isEnabled = true
            stopButton.isEnabled = false
            progressMeter.stopAnimation(nil)
            progressMeter.increment(by: progressMeter.maxValue)
        }
    }
    
    func speechSynthesizer(_ sender: NSSpeechSynthesizer, willSpeakWord characterRange: NSRange, of string: String) {
        progressMeter.increment(by: Double(wordsPerSecond!))
        
        wordsReadUpTo = wordsReadUpTo + 1
        progressTextField.stringValue = "\(wordsReadUpTo) / \(numberOfWords()) Words - Average \(wordsPerSecond) Words Per Second."
    }
    
    // function to calculate number of words available in the document when hitting speak
    func numberOfWords() -> Int? {
        return contents?.components(separatedBy: " ").count
    }
}

