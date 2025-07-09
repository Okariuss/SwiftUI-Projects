//
//  ItemModelTests.swift
//  TodoList
//
//  Created by Okan Orkun on 8.07.2025.
//

import Testing
@testable import TodoList

struct ItemModelTests {
    
    @Test
    func test_updateCompletion_togglesFromIncompleteToComplete() {
        let item = ItemModel(id: "1", title: "Test", isCompleted: false)
        let updatedItem = item.updateCompletion()
        #expect(updatedItem.isCompleted)
    }
    
    @Test
    func test_updateCompletion_togglesFromCompleteToIncomplete() {
        let item = ItemModel(id: "1", title: "Test", isCompleted: true)
        let updatedItem = item.updateCompletion()
        #expect(!updatedItem.isCompleted)
    }
    
    @Test
    func test_updateCompletion_preservesIDAndTitle() {
        let item = ItemModel(id: "1", title: "Test", isCompleted: false)
        let updatedItem = item.updateCompletion()
        #expect(updatedItem.id == item.id)
        #expect(updatedItem.title == item.title)
    }
}
