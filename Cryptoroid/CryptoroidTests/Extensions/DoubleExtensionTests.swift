//
//  DoubleExtensionTests.swift
//  CryptoroidTests
//
//  Created by Okan Orkun on 1.08.2025.
//

import Testing
@testable import Cryptoroid

struct DoubleExtensionTests {

    @Test
    func test_asCurrencyWith2Decimals() {
        #expect(1234.56.asCurrencyWith2Decimals() == "$1.234,56")
        #expect(0.5.asCurrencyWith2Decimals() == "$0,50")
    }

    @Test
    func test_asCurrencyWith6Decimals() {
        #expect(1234.56.asCurrencyWith6Decimals() == "$1.234,56")
        #expect(0.123456.asCurrencyWith6Decimals() == "$0,123456")
        #expect(0.1.asCurrencyWith6Decimals() == "$0,10")
    }
    
    @Test
    func test_asNumberString() {
        #expect(1.2345.asNumberString() == "1.23")
    }
    
    @Test
    func test_asPercentString() {
        #expect(1.2345.asPercentString() == "1.23%")
    }
    
    @Test
    func test_formattedWithAbbreviations() {
        #expect(12.formattedWithAbbreviations() == "12.00")
        #expect(1234.formattedWithAbbreviations() == "1.23K")
        #expect(123456.formattedWithAbbreviations() == "123.46K")
        #expect(12345678.formattedWithAbbreviations() == "12.35M")
        #expect(1234567890.formattedWithAbbreviations() == "1.23Bn")
        #expect(123456789012.formattedWithAbbreviations() == "123.46Bn")
        #expect(12345678901234.formattedWithAbbreviations() == "12.35Tr")
    }
}
