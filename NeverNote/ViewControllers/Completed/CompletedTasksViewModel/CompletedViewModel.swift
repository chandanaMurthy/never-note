//
//  CompletedViewModel.swift
//  NeverNote
//
//  Created by Chandana on 9/19/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import Foundation

class CompletedViewModel {
    weak var delegate: CompletedViewModelDelegate?
    private var completedTasks = [Task]() {
        didSet {
            if completedTasks.isEmpty {
                delegate?.hideCompletedTableView(in: self)
            } else {
                delegate?.showCompletedTableView(in: self)
            }
        }
    }
    private var indexPathArray = [IndexPath]()
    private var indexes = [Int]()
    private var filteredData = [Task]()
    private var completedTasksChanged = false
    
    func getIndexPathArray() -> [IndexPath] {
        return indexPathArray
    }
    
    func addToIndexPathArray(indexPath: IndexPath) {
        indexPathArray.append(indexPath)
    }
    
    func addToCompletedTasks(task: Task) {
        completedTasks.append(task)
    }
    
    func removeFromCompletedTasks(at position: Int) {
        completedTasks.remove(at: position)
    }
    
    func clearIndexPathArray() {
        indexPathArray.removeAll()
    }
    
    func getCompledTasksCount() -> Int {
        return completedTasks.count
    }
    
    func getCompletedTaskName(at index: Int) -> Task {
        return completedTasks[index]
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
    
    func changeCompletedTasks() {
        completedTasksChanged = true
    }
    
    func retainCompletedTasks() {
        completedTasksChanged = false
    }
    
    func getCompletedTaskStatus() -> Bool {
        return completedTasksChanged
    }
}

protocol CompletedViewModelDelegate: class {
    func hideCompletedTableView(in completedViewModel: CompletedViewModel)
    func showCompletedTableView(in completedViewModel: CompletedViewModel)
}
