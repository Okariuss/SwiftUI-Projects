//
//  UIApplicationExtension.swift
//  Cryptoroid
//
//  Created by Okan Orkun on 28.07.2025.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
