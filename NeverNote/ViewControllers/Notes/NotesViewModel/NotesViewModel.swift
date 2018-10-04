//
//  NotedViewModel.swift
//  NeverNote
//
//  Created by Chandana on 9/19/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import Foundation

class NotesViewModel {
    weak var delegate: NotesViewModelDelegate?
    private var tasks = [Task]() {
        didSet {
            if tasks.isEmpty {
                delegate?.hideNotesTableView(in: self)
            } else {
                delegate?.showNotesTableView(in: self)
            }
        }
    }
    private var notesIndexPathArray = [IndexPath]()
    private var taskNames = [String]()
    private var indexes = [Int]()
    private var filteredData = [Task]()
    
    func getIndexPathArray() -> [IndexPath] {
        return notesIndexPathArray
    }
    
    func addToNotesIndexpathArray(indexPath: IndexPath) {
        notesIndexPathArray.append(indexPath)
    }
    
    func clearIndexPathArray() {
        notesIndexPathArray.removeAll()
    }
    
    func addToTasks(task: Task) {
        tasks.append(task)
    }
    
    func removeFromTasks(at position: Int) {
        tasks.remove(at: position)
    }
    
    func getTasksCount() -> Int {
        return tasks.count
    }
    
    func getTaskName(at index: Int) -> Task {
        return tasks[index]
    }
    
    func clearTaskNames() {
        taskNames.removeAll()
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

protocol NotesViewModelDelegate: class {
    func hideNotesTableView(in notesViewModel: NotesViewModel)
    func showNotesTableView(in notesViewModel: NotesViewModel)
}
