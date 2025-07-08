//
//  ItemModel.swift
//  TodoList
//
//  Created by Okan Orkun on 8.07.2025.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
