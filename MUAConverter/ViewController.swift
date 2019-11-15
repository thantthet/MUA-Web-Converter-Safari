//
//  ViewController.swift
//  MUAConverter
//
//  Created by Thant Thet on 15/11/2019.
//  Copyright © 2019 MUA. All rights reserved.
//

import Cocoa
import SafariServices.SFSafariApplication

class ViewController: NSViewController {

    @IBOutlet var appNameLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.appNameLabel.stringValue = "Click the button below to enable MUA extension in Safari to use. You can quite this app after extension is enabled.";
    }
    
    @IBAction func openSafariExtensionPreferences(_ sender: AnyObject?) {
        SFSafariApplication.showPreferencesForExtension(withIdentifier: "org.mua.MUAConverter-Extension") { error in
            if let _ = error {
                // Insert code to inform the user that something went wrong.

            }
        }
    }

}
