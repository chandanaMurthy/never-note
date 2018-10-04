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
    let LOGOUT = "Logout"
    let LOGOUT_MESSAGE = "Are You Sure You Want To Logout?"
    let CONFIRM = "Yes"
    let CANCEL = "Cancel"
    private var filteredData = [String]()

    func addToSettingsList(name: String) {
        settingsList.append(name)
    }
    
    func getSettingName(at index: NSInteger) -> String {
        return self.settingsList[index]
    }
    
    func getSettingsListCount() -> Int {
        return self.settingsList.count
    }
    
    func getFilteredDataName(at position: Int) -> String {
        return filteredData[position]
    }
    
    func getFilteredDataCount() -> Int {
        return filteredData.count
    }
    
    func addToFilteredData(task: String) {
        filteredData.append(task)
    }
    
    func removeFromFilteredData(at position: Int) {
        filteredData.remove(at: position)
    }
    
    func clearFilteredData() {
        filteredData.removeAll()
    }
}
