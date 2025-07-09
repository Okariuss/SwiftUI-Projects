//
//  ListViewModelTests.swift
//  TodoList
//
//  Created by Okan Orkun on 8.07.2025.
//

import Foundation
import Testing
@testable import TodoList

struct ListViewModelTests {
    
    @Test
    func test_addItem_addsItemToItems() {
        let suitName = UUID().uuidString
        let testDefaults = UserDefaults(suiteName: suitName)!
        let viewModel = ListViewModel(userDefaults: testDefaults)
        viewModel.addItem(title: "Test Item")
        
        #expect(viewModel.items.count == 1)
        #expect(viewModel.items[0].title == "Test Item")
    }
    
    @Test
    func test_deleteItem_removesCorrectItemFromItems() {
        let suitName = UUID().uuidString
        let testDefaults = UserDefaults(suiteName: suitName)!
        let viewModel = ListViewModel(userDefaults: testDefaults)
        viewModel.addItem(title: "Test Item 1")
        viewModel.addItem(title: "Test Item 2")
        viewModel.addItem(title: "Test Item 3")
        let deletedId = viewModel.items[1].id
        
        viewModel.deleteItem(indexSet: IndexSet(integer: 1))
        
        #expect(viewModel.items.count == 2)
        #expect(viewModel.items.contains(where: { $0.id != deletedId }))
    }
    
    @Test
    func test_moveItem_movesCorrectItemToCorrectIndexInItems() {
        let suitName = UUID().uuidString
        let testDefaults = UserDefaults(suiteName: suitName)!
        let viewModel = ListViewModel(userDefaults: testDefaults)
        viewModel.addItem(title: "Test Item 1")
        viewModel.addItem(title: "Test Item 2")
        viewModel.addItem(title: "Test Item 3")
        
        viewModel.moveItem(from: IndexSet(integer: 0), to: 2)
        
        let titles = viewModel.items.map(\.title)
        #expect(titles == ["Test Item 2", "Test Item 1", "Test Item 3"])
    }
    
    @Test
    func test_updateItem_togglesCompletionState() {
        let suitName = UUID().uuidString
        let testDefaults = UserDefaults(suiteName: suitName)!
        let viewModel = ListViewModel(userDefaults: testDefaults)
        viewModel.addItem(title: "Complete Me :)")
        let item = viewModel.items[0]
        
        viewModel.updateItem(item: item)
        
        #expect(viewModel.items[0].isCompleted)
    }
    
    @Test
    func test_init_getItems_shouldEmpty() {
        let suitName = UUID().uuidString
        let testDefaults = UserDefaults(suiteName: suitName)!
        let viewModel = ListViewModel(userDefaults: testDefaults)
        
        #expect(viewModel.items.isEmpty)
    }
    
    @Test
    func test_init_getItems_loadsDataFromUserDefaults() {
        let suitName = UUID().uuidString
        let testDefaults = UserDefaults(suiteName: suitName)!
        let item = ItemModel(title: "Saved Item", isCompleted: false)
        if let data = try? JSONEncoder().encode([item]) {
            testDefaults.set(data, forKey: "items_list")
        }
        
        let viewModel = ListViewModel(userDefaults: testDefaults)
        
        #expect(viewModel.items.count == 1)
        #expect(viewModel.items[0].title == "Saved Item")
    }
    
    @Test
    func test_itemsDidSet_shouldSaveDataToUserDefaults() {
        let suitName = UUID().uuidString
        let testDefaults = UserDefaults(suiteName: suitName)!
        
        let viewModel = ListViewModel(userDefaults: testDefaults)
        viewModel.addItem(title: "Persistent Item")
        
        let data = testDefaults.data(forKey: "items_list")
        let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data ?? Data())
        
        #expect(savedItems?.count == 1)
        #expect(savedItems?.first?.id == viewModel.items[0].id)
    }
}
