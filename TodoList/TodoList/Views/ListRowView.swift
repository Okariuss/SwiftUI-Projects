//
//  ListRowView.swift
//  TodoList
//
//  Created by Okan Orkun on 7.07.2025.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview("First item", traits: .sizeThatFitsLayout) {
    ListRowView(item: ItemModel(title: "First item!", isCompleted: false))
}

#Preview("Second item", traits: .sizeThatFitsLayout) {
    ListRowView(item: ItemModel(title: "Second item!", isCompleted: true))
}
