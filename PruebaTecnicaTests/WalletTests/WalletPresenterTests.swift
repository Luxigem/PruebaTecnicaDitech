//
//  WalletPresenterTests.swift
//  PruebaTecnicaTests
//
//  Created by Miguel on 8/26/23.
//

import XCTest
@testable import PruebaTecnica

final class WalletPresenterTests: XCTestCase {

    var systemUnderTest: WalletPresenter!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        systemUnderTest = WalletPresenter()
    }

    override func tearDownWithError() throws {
        systemUnderTest = nil
        
        try super.tearDownWithError()
    }

    func testGetCurrenciesList() {
        // Given
        // When
        let currenciesList: [(currencyName: String, currencyId: String)] = systemUnderTest.getCurrenciesList()
        // Then
        XCTAssertEqual(currenciesList.count, 10)
        XCTAssertEqual(currenciesList[0].currencyId, "BTC")
    }
    
    func testGetRandomValue() {
        // Given
        var floatRandomValue: Float = 0
        // When
        let randomValue: String = systemUnderTest.getRandomValue()
        if let randomValue: Float = Float(randomValue) {
            floatRandomValue = randomValue
        }
        // Then
        XCTAssertLessThanOrEqual(floatRandomValue, Float(1000))
        XCTAssertGreaterThanOrEqual(floatRandomValue, Float(0))
    }
    
    func testGetRandomChange() {
        // Given
        var floatRandomChange: Float = 0
        // When
        let randomChange: (change: String, color: UIColor) = systemUnderTest.getRandomChange()
        var changeValue = randomChange.change
        changeValue.removeLast()
        if let randomChange: Float = Float(changeValue) {
            floatRandomChange = randomChange
        }
        // Then
        XCTAssertLessThanOrEqual(floatRandomChange, Float(5))
        XCTAssertGreaterThanOrEqual(floatRandomChange, Float(-5))
        if floatRandomChange > 0 {
            XCTAssertEqual(randomChange.color, UIColor.green)
        } else if floatRandomChange < 0 {
            XCTAssertEqual(randomChange.color, UIColor.red)
        } else {
            XCTAssertEqual(randomChange.color, UIColor.yellow)
        }
    }
}
