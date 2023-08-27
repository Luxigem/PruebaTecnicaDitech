//
//  CurrencyPresenterTests.swift
//  PruebaTecnicaTests
//
//  Created by Miguel on 8/26/23.
//

import XCTest
@testable import PruebaTecnica

final class CurrencyPresenterTests: XCTestCase {

    var systemUnderTest: CurrencyPresenter!
    var delegateMock: CurrencyPresenterDelegateMock!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        systemUnderTest = CurrencyPresenter()
        delegateMock = CurrencyPresenterDelegateMock()
        systemUnderTest.delegate = delegateMock
    }

    override func tearDownWithError() throws {
        systemUnderTest = nil
        delegateMock = nil
        URLProtocolMock.testURLs = [:]
        
        try super.tearDownWithError()
    }

    func testPerformRequestSuccessResponse() async {
        // Given
        let url: URL? = URL(string: "https://rest.coinapi.io/v1/quotes/BITSTAMP_SPOT_BTC_USD/current?apikey=85DA0131-A9BB-4E35-AABA-A0DF64603FE3")
        let jsonString: String = """
        {
          "ask_price": 26112,
          "ask_size": 0.13382379,
          "bid_price": 26111,
          "bid_size": 0.97443048,
          "last_trade": {
            "taker_side": "BUY"
          }
        }
        """
        let jsonData: Data = jsonString.data(using: .utf8)!
        URLProtocolMock.testURLs = [url: jsonData]
        let config: URLSessionConfiguration = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]
        let session: URLSession = URLSession(configuration: config)
        // When
        systemUnderTest.performRequest(id: "BTC", urlSession: session)
        try? await Task.sleep(nanoseconds: 10_000_000)
        // Then
        XCTAssertEqual(delegateMock.currencyModel?.currencyAskPrice, 26112)
    }
    
    func testPerformRequestFailureResponse() async {
        // Given
        let url: URL? = URL(string: "")
        let jsonString: String = """
        {
          "ask_price": 26112,
          "ask_size": 0.13382379,
          "bid_price": 26111,
          "bid_size": 0.97443048,
          "last_trade": {
            "taker_side": "BUY"
          }
        }
        """
        let jsonData: Data = jsonString.data(using: .utf8)!
        URLProtocolMock.testURLs = [url: jsonData]
        let config: URLSessionConfiguration = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]
        let session: URLSession = URLSession(configuration: config)
        // When
        systemUnderTest.performRequest(id: "BTC", urlSession: session)
        try? await Task.sleep(nanoseconds: 10_000_000)
        // Then
        XCTAssertNotNil(delegateMock.error)
        XCTAssertNil(delegateMock.currencyModel)
    }
    
    func testPerformRequestFailureParsing() async {
        // Given
        let url: URL? = URL(string: "https://rest.coinapi.io/v1/quotes/BITSTAMP_SPOT_BTC_USD/current?apikey=85DA0131-A9BB-4E35-AABA-A0DF64603FE3")
        let jsonString: String = """
        {
        }
        """
        let jsonData: Data = jsonString.data(using: .utf8)!
        URLProtocolMock.testURLs = [url: jsonData]
        let config: URLSessionConfiguration = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]
        let session: URLSession = URLSession(configuration: config)
        // When
        systemUnderTest.performRequest(id: "BTC", urlSession: session)
        try? await Task.sleep(nanoseconds: 10_000_000)
        // Then
        XCTAssertNotNil(delegateMock.error)
        XCTAssertNil(delegateMock.currencyModel)
    }
}
