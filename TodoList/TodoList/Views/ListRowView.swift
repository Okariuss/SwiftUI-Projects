//
//  ListRowView.swift
//  TodoList
//
//  Created by Okan Orkun on 7.07.2025.
//

import SwiftUI

struct ListRowView: View {
    
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
        }
    }
}

#Preview {
    ListRowView(title: "First Item")
}
