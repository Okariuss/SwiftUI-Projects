//
//  HapticManager.swift
//  Cryptoroid
//
//  Created by Okan Orkun on 29.07.2025.
//

import Foundation
import SwiftUI

final class HapticManager {
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
