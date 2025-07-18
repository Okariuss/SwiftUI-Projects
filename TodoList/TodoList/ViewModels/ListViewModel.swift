//
//  ListViewModel.swift
//  TodoList
//
//  Created by Okan Orkun on 8.07.2025.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    private let userDefaults: UserDefaults
    let itemsKey: String = "items_list"
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
        getItems()
    }
    
    func getItems() {
        guard
            let data = userDefaults.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            userDefaults.set(encodedData, forKey: itemsKey)
        }
    }
}
