//
//  SettingsViewModel.swift
//  NeverNote
//
//  Created by Chandana on 9/19/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import Foundation

class SettingsViewModel {
    private var settingsList = [String]()
    let PASSWORD = "Change Password"
    let PROFILE_PICTURE = "Change Profile Picture"
    
    func addToSettingsList(name: String) {
        settingsList.append(name)
    }
    
    func getSettingName(at index: NSInteger) -> String {
        return self.settingsList[index]
    }
    
    func getSettingsListCount() -> Int {
        return self.settingsList.count
    }
}
