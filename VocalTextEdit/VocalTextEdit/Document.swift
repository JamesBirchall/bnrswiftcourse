//
//  Document.swift
//  VocalTextEdit
//
//  Created by James Birchall on 29/09/2016.
//  Copyright © 2016 James Birchall. All rights reserved.
//

import Cocoa

class Document: NSDocument {
    
    var contents: String = " "

    override class func autosavesInPlace() -> Bool {
        return true
    }

    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: "Document Window Controller") as! NSWindowController
        
        let viewController = windowController.contentViewController as! ViewController
        viewController.contents = contents
        
        self.addWindowController(windowController)
    }

    override func data(ofType typeName: String) throws -> Data {
        
        // to save data out from a document
        let windowController = windowControllers[0]
        let viewController = windowController.contentViewController as! ViewController
        
        let contents = viewController.contents ?? "" // take string or empty string if nil
        
        if let data = contents.data(using: String.Encoding.utf8) {
            return data
        } else {
            let userInfo = [NSLocalizedRecoverySuggestionErrorKey: "File cannot be encoded in UTF-8"]
            throw NSError(domain: "com.birchall.bnrswift.VocalTextEdit", code: 0, userInfo: userInfo)
        }
    }

    override func read(from data: Data, ofType typeName: String) throws {
        
        let contents: String? = String(bytes: data, encoding: .utf8)
        
        if contents != nil {
            Swift.print(contents)
            self.contents = contents!   // we are safe at this point so unwrap
        } else {
            let userInfo = [NSLocalizedRecoverySuggestionErrorKey: "File is not valid UTF-8"]
            throw NSError(domain: "com.birchall.bnrswift.VocalTextEdit", code: 0, userInfo: userInfo)
        }
    }


}

