//
//  SafariExtensionViewController.swift
//  MUAConverter Extension
//
//  Created by Thant Thet on 15/11/2019.
//  Copyright © 2019 MUA. All rights reserved.
//

import SafariServices

class SafariExtensionViewController: SFSafariExtensionViewController {
    
    @IBOutlet weak var stateLabel: NSTextField!
    @IBOutlet weak var noticeLabel: NSTextField!
    @IBOutlet weak var switchControl: NSSwitch!
    
    private var isDisabled: Bool {
        get {
            Prefs.getIsDisabled()
        }
        set {
            Prefs.setIsDisabled(value: newValue)
            updateViewStats()
        }
    }
    
    static let shared: SafariExtensionViewController = {
        let shared = SafariExtensionViewController()
        shared.preferredContentSize = NSSize(width:250, height:100)
        return shared
    }()
    
    @IBAction func didChangeSwitch(_ sender: Any) {
        isDisabled = switchControl.state == .off
        noticeLabel.isHidden = false
        noticeLabel.stringValue = "Reload the page to apply changes."
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        updateViewStats()
    }
    
    override func viewWillDisappear() {
        super.viewWillDisappear()
        
        noticeLabel.isHidden = true
    }
    
    func updateViewStats() {
        let text = isDisabled ? "Off" : "On"
        stateLabel.stringValue = text
        switchControl.state = isDisabled ? .off : .on
        
        SFSafariApplication.setToolbarItemsNeedUpdate()
    }
}
