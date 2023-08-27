//
//  MenuPresenterTests.swift
//  PruebaTecnicaTests
//
//  Created by Miguel on 8/25/23.
//

import XCTest
@testable import PruebaTecnica

final class MenuPresenterTests: XCTestCase {

    var systemUnderTest: MenuPresenter!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        systemUnderTest = MenuPresenter()
    }

    override func tearDownWithError() throws {
        systemUnderTest = nil
        
        try super.tearDownWithError()
    }

    func testGetTitleText() {
        // Given
        // When
        let titleText: String = systemUnderTest.getTitleText()
        // Then
        XCTAssertEqual(titleText, "Welcome to\nCryptoWallet!")
    }
    
    func testGetInfoText() {
        // Given
        // When
        let infoText: String = systemUnderTest.getInfoText()
        // Then
        XCTAssertEqual(infoText, "If you are creating a new wallet press the GENERATE button. Take note of the mnemonic phrase, it should be stored in a safe place.")
    }
    
    func testGetWordsText() {
        // Given
        // When
        let wordsText: String = systemUnderTest.getWordsText()
        // Then
        XCTAssertEqual(wordsText, "address list elephant geniune thunder conduct avocado educate chronic useless basic rough notable noble water bless labor monster muscle bike view caution river flavor")
    }
}
