//
//  Prefs.swift
//  MUAConverter Extension
//
//  Created by Thant Thet on 15/11/2019.
//  Copyright © 2019 MUA. All rights reserved.
//

import Foundation

struct Prefs {
    static let KeyIsDisabled = "isDisabled"
    
    static func getIsDisabled() -> Bool {
        UserDefaults.standard.bool(forKey: KeyIsDisabled)
    }
    
    static func setIsDisabled(value: Bool) {
        UserDefaults.standard.set(value, forKey: KeyIsDisabled)
    }
}
