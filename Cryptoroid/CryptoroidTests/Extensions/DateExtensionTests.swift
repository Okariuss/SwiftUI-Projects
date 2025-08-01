//
//  DateExtensionTests.swift
//  CryptoroidTests
//
//  Created by Okan Orkun on 1.08.2025.
//

import Testing
@testable import Cryptoroid
import Foundation

struct DateExtensionTests {

    @Test
    func test_initWithValidCoinGeckoString_returnsCorrectDate() {
        let input = "2022-06-01T12:34:56.789Z"
        let date = Date(coinGeckoString: input)
        
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        #expect(components.year == 2022)
        #expect(components.month == 6)
        #expect(components.day == 1)
        #expect(components.hour == 12)
        #expect(components.minute == 34)
        #expect(components.second == 56)
    }

    @Test
    func test_initWithInvalidCoinGeckoString_returnsNow() {
        let before = Date()
        let date = Date(coinGeckoString: "Invalid String")
        let after = Date()
        
        #expect(date >= before && date <= after)
    }
    
    @Test
    func test_asShortDateString_formatsCorrectly() {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        
        #expect(Date().asShortDateString() == formatter.string(from: Date()))
    }
}
