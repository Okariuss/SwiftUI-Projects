//
//  XMarkButton.swift
//  Cryptoroid
//
//  Created by Okan Orkun on 28.07.2025.
//

import SwiftUI

struct XMarkButton: View {
    let action: () -> Void

    
    var body: some View {
        Button(action: action) {
            Image(systemName: "xmark")
                .font(.headline)
        }
    }
}

#Preview {
    XMarkButton(action: { })
}
