//
//  AddView.swift
//  TodoList
//
//  Created by Okan Orkun on 7.07.2025.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something to add...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.gray.opacity(0.4))
                    .cornerRadius(10)
                
                Button {
                    
                } label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.primary)
                        .cornerRadius(10)
                }
            }
            .padding(14)
        }
        .navigationTitle("Add an Item ✏")
    }
}

#Preview {
    NavigationStack {
        AddView()
    }
}
