//
//  SafariExtensionViewController.swift
//  MUAConverter Extension
//
//  Created by Thant Thet on 15/11/2019.
//  Copyright © 2019 MUA. All rights reserved.
//

import SafariServices

class SafariExtensionViewController: SFSafariExtensionViewController {
    
    static let shared: SafariExtensionViewController = {
        let shared = SafariExtensionViewController()
        shared.preferredContentSize = NSSize(width:320, height:240)
        return shared
    }()

}
