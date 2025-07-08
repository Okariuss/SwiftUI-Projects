//
//  ListView.swift
//  TodoList
//
//  Created by Okan Orkun on 7.07.2025.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "First title", isCompleted: false),
        ItemModel(title: "Second title", isCompleted: true),
        ItemModel(title: "Third title", isCompleted: false)
    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Todo List 📋")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            
            ToolbarItemGroup(placement: .topBarTrailing) {
                NavigationLink("Add") {
                    AddView()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
}
