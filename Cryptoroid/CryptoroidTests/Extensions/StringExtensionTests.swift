//
//  StringExtensionTests.swift
//  CryptoroidTests
//
//  Created by Okan Orkun on 1.08.2025.
//

import Testing
@testable import Cryptoroid

struct StringExtensionTests {

    @Test
    func test_removingHTMLOccurrences_removesTagsCorrectly() {
        let htmlString = "<p>Hello, <b>world</b>!</p>"
        #expect(htmlString.removingHTMLOccurrences == "Hello, world!")
    }

}
