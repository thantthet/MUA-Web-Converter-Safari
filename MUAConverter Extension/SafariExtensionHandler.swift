//
//  SafariExtensionHandler.swift
//  MUAConverter Extension
//
//  Created by Thant Thet on 15/11/2019.
//  Copyright © 2019 MUA. All rights reserved.
//

import SafariServices

class SafariExtensionHandler: SFSafariExtensionHandler {
    
    override func messageReceived(withName messageName: String, from page: SFSafariPage, userInfo: [String : Any]?) {
        switch messageName {
        case "DocumentIsReady":
            // dispatch message only when enabled
            if !Prefs.getIsDisabled() {
                page.dispatchMessageToScript(withName: "ConvertAndObserve", userInfo: nil)
            }
        default:
            break
        }
    }
    
    override func toolbarItemClicked(in window: SFSafariWindow) {

    }
    
    override func validateToolbarItem(in window: SFSafariWindow, validationHandler: @escaping ((Bool, String) -> Void)) {
        
        window.getToolbarItem { (toolbar) in
            let isDisabled = Prefs.getIsDisabled()

            if isDisabled {
                // show "off" badge text
                toolbar?.setBadgeText("off")
            } else {
                toolbar?.setBadgeText(nil)
            }
        }
        
        validationHandler(true, "")
    }
    
    override func popoverViewController() -> SFSafariExtensionViewController {
        return SafariExtensionViewController.shared
    }

}
