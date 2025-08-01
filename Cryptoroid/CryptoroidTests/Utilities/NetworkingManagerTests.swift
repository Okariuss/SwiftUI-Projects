//
//  NetworkingManagerTests.swift
//  CryptoroidTests
//
//  Created by Okan Orkun on 1.08.2025.
//

import Testing
@testable import Cryptoroid
import SwiftUI

struct NetworkingManagerTests {

    @Test
    func test_download_withValidData_returnsData() async throws {
        let url = URL(string: "https://api.coingecko.com/api/v3/ping")!
        let publisher = NetworkingManager.dowmload(url: url)
        
        var result: Data?
        for try await value in publisher.values {
            result = value
            break
        }
        #expect(result != nil)
    }

    @Test
    func test_download_withInvalidURL_throwsError() async throws {
        let url = URL(string: "invalid url")!
        let publisher = NetworkingManager.dowmload(url: url)
        
        var didFail = false
        do {
            for try await _ in publisher.values { }
        } catch {
            didFail = true
        }
        #expect(didFail)
    }
    
    @Test
    func test_handleURLResponse_withValidResponse_returnsData() throws {
        let url = URL(string: "www.example.com")!
        let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
        let output = (data: Data(), response: response)
        let result = try NetworkingManager.handleURLResponse(output: output, url: url)
        #expect(result == Data())
    }
    
    @Test
    func test_handleURLResponse_withInvalidResponse_throwsError() throws {
        let url = URL(string: "www.example.com")!
        let response = HTTPURLResponse(url: url, statusCode: 404, httpVersion: nil, headerFields: nil)!
        let output = (data: Data(), response: response)
        var didThrow = false
        do {
            _ = try NetworkingManager.handleURLResponse(output: output, url: url)
        } catch {
            didThrow = true
        }
        
        #expect(didThrow)
    }
    
    @Test
    func test_handleCompletion_doesNotCrashOnFinished() {
        NetworkingManager.handleCompletion(completion: .finished)
        #expect(true)
    }
    
    @Test
    func test_handleCompletion_doesNotCrashOnFailure() {
        let error = NetworkingManager.NetworkingError.badURLResponse(url: URL(string: "bad")!)
        NetworkingManager.handleCompletion(completion: .failure(error))
        #expect(true)
    }
}
