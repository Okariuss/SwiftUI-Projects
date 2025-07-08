//
//  ItemModel.swift
//  TodoList
//
//  Created by Okan Orkun on 8.07.2025.
//

import Foundation

// Immutable struct
struct ItemModel: Identifiable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> Self {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
