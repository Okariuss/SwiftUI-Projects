//
//  StringExtension.swift
//  Cryptoroid
//
//  Created by Okan Orkun on 31.07.2025.
//

import Foundation

extension String {
    var removingHTMLOccurrences: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
    }
}
