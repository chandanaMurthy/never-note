//
//  ViewModel.swift
//  NeverNote
//
//  Created by Chandana on 9/19/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import Foundation

class TrashViewModel {
    weak var delegate: TrashViewModelDelegate?
    private var deletedTasks = [Task]() {
        didSet {
            if deletedTasks.isEmpty {
                delegate?.hideTrashTableView(in: self)
            } else {
                delegate?.showTrashTableView(in: self)
            }
        }
    }
    private var toInsertTasks = [Task]()
    private var indexes = [Int]()
    private var filteredData = [Task]()
    let DELETE = "Delete!"
    let CONFIRM = "Confirm"
    let ALERT_MESSAGE = "Are You Sure You Want To Empty Trash Completely?"
    let CANCEL = "Cancel"
    
    func getTasksToInsert() -> [Task] {
        return toInsertTasks
    }
    
    func getDeletedTaskName(at index: Int) -> Task {
        return deletedTasks[index]
    }
    
    func getDeletedTasksCount() -> Int {
        return deletedTasks.count
    }
    
    func clearDeletedTasks() {
        deletedTasks.removeAll()
    }
    
    func clearInsertTasksArray() {
        toInsertTasks.removeAll()
    }
    
    func addToDeletedTasks(task: Task) {
        deletedTasks.append(task)
    }
    
    func addToInsertTasks(task: Task) {
        toInsertTasks.append(task)
    }
    
    func removeFromDeletedTasks(at position: Int) {
        deletedTasks.remove(at: position)
    }
    
    func getIndex(at position: Int) -> Int {
        return indexes[position]
    }
    
    func clearIndexArray() {
        indexes.removeAll()
    }
    
    func addToIndexArray(index: Int) {
        indexes.append(index)
    }
    
    func removeFromIndexArray(at position: Int) {
        indexes.remove(at: position)
    }
    
    func getFilteredDataName(at position: Int) -> Task {
        return filteredData[position]
    }
    
    func getFilteredDataCount() -> Int {
        return filteredData.count
    }
    
    func addToFilteredData(task: Task) {
        filteredData.append(task)
    }
    
    func removeFromFilteredData(at position: Int) {
        filteredData.remove(at: position)
    }
    
    func clearFilteredData() {
        filteredData.removeAll()
    }
}

protocol TrashViewModelDelegate: class {
    func hideTrashTableView(in trashViewModel: TrashViewModel)
    func showTrashTableView(in trashViewModel: TrashViewModel)
}
