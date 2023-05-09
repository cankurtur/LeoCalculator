//
//  HomePresenterTests.swift
//  LeoCalculatorTests
//
//  Created by Can Kurtur on 8.05.2023.
//

@testable import LeoCalculator
import XCTest

final class HomePresenterTests: XCTestCase {
    
    var sut: HomePresenter!
    var mockRouter: MockHomeRouter!
    var mockInteractor: MockHomeInteractor!
    var mockView: MockHomeViewController!
    var mockCompositionRoot: CompositionRootInterface!
    
    override func setUp() {
        mockRouter = MockHomeRouter()
        mockInteractor = MockHomeInteractor()
        mockView = MockHomeViewController()
        mockCompositionRoot = MockCompositionRoot()
        
        sut = HomePresenter(router: mockRouter, interactor: mockInteractor, view: mockView, compositionRoot: mockCompositionRoot)
        mockInteractor.output = sut
    }
    
    func test_viewDidLoad_success() {
        // Given
        XCTAssertFalse(mockView.isPrepareUICalled)
        XCTAssertFalse(mockView.isUpdateUICalled)
        
        // TODO: composition root test notification
        // When
        sut.viewDidLoad()
        // Then
        XCTAssertTrue(mockView.isPrepareUICalled)
        XCTAssertTrue(mockView.isUpdateUICalled)
    }
    
    func test_numpadButtonTapped_notNilTitle_success() {
        // Given
        let givenTitle = "5"
        XCTAssertFalse(mockView.isSetResultLabelCalled)
        // TODO: private set number?
        // When
        sut.numpadButtonTapped(title: givenTitle)
        // Then
        XCTAssertTrue(mockView.isSetResultLabelCalled)
    }
    
    func test_numpadButtonTapped_nilTitle_success() {
        // Given
        XCTAssertFalse(mockView.isSetResultLabelCalled)
        // TODO: private set number?
        // When
        sut.numpadButtonTapped(title: nil)
        // Then
        XCTAssertFalse(mockView.isSetResultLabelCalled)
    }
    
    func test_basicOperationsTapped_isNotOnTheFirstCalculation_notNilOperation_success() {
        // Given
        let givenTitle = "4"
        sut.numpadButtonTapped(title: givenTitle)
        let givenOperation = "+"
        XCTAssertFalse(sut.isOnTheFirstCalculation)
        // When
        sut.basicOperationsTapped(operation: givenOperation)
        // Then
        XCTAssertTrue(sut.isOnTheFirstCalculation)
    }
    
    
    func test_basicOperationsTapped_isNotOnTheFirstCalculation_nilOperation_success() {
        // Given
        let givenTitle = "4"
        sut.numpadButtonTapped(title: givenTitle)
        XCTAssertFalse(sut.isOnTheFirstCalculation)
        // When
        sut.basicOperationsTapped(operation: nil)
        // Then
        XCTAssertFalse(sut.isOnTheFirstCalculation)
    }
    
    func test_basicOperationsTapped_isOnTheFirstCalculation_notNilTitle_success() {
        // Given
        let operation = "+"
        
        let firstGivenTitle = "1"
        sut.numpadButtonTapped(title: firstGivenTitle)
        
        sut.basicOperationsTapped(operation: operation)
        
        let secondGivenTitle = "2"
        sut.numpadButtonTapped(title: secondGivenTitle)
        
        XCTAssertTrue(sut.isOnTheFirstCalculation)
        // When
        sut.basicOperationsTapped(operation: operation)
        // Then
        XCTAssertFalse(sut.isOnTheFirstCalculation)
    }
    
    func test_basicOperationsTapped_isOnTheFirstCalculation_nilTitle_success() {
        // Given
        let operation = "+"
        
        let firstGivenTitle = "1"
        sut.numpadButtonTapped(title: firstGivenTitle)
        
        sut.basicOperationsTapped(operation: operation)
        
        let secondGivenTitle = "2"
        sut.numpadButtonTapped(title: secondGivenTitle)
        
        XCTAssertTrue(sut.isOnTheFirstCalculation)
        // When
        sut.basicOperationsTapped(operation: nil)
        // Then
        XCTAssertTrue(sut.isOnTheFirstCalculation)
    }
    
    func test_basicOperationsTapped_isNotOnTheFirstCalculation_ifResultNumberNotZero_notnilTitle_success() {
        // Given
        let operation = "+"
        
        let firstGivenTitle = "1"
        sut.numpadButtonTapped(title: firstGivenTitle)
        
        sut.basicOperationsTapped(operation: operation)
        
        let secondGivenTitle = "2"
        sut.numpadButtonTapped(title: secondGivenTitle)
        sut.basicOperationsTapped(operation: operation)
        
        let thirdGivenTitle = "3"
        sut.numpadButtonTapped(title: thirdGivenTitle)
        XCTAssertFalse(sut.isOnTheFirstCalculation)
        // When
        sut.basicOperationsTapped(operation: operation)
        // Then
        XCTAssertFalse(sut.isOnTheFirstCalculation)
    }
    
    func test_basicOperationsTapped_isNotOnTheFirstCalculation_ifResultNumberNotZero_nilTitle_success() {
        // Given
        let operation = "+"
        
        let firstGivenTitle = "1"
        sut.numpadButtonTapped(title: firstGivenTitle)
        
        sut.basicOperationsTapped(operation: operation)
        
        let secondGivenTitle = "2"
        sut.numpadButtonTapped(title: secondGivenTitle)
        sut.basicOperationsTapped(operation: operation)
        
        let thirdGivenTitle = "3"
        sut.numpadButtonTapped(title: thirdGivenTitle)
        XCTAssertFalse(sut.isOnTheFirstCalculation)
        // When
        sut.basicOperationsTapped(operation: nil)
        // Then
        XCTAssertFalse(sut.isOnTheFirstCalculation)
    }
    
    func test_extraOperationsTapped_ifHasCurrenNumber_notNilOperation_success() {
        // Given
        let currentNumber = "3"
        let givenOperation = "sin"
        sut.numpadButtonTapped(title: currentNumber)
        // When
        sut.extraOperationsTapped(operation: givenOperation)
        // Then
        XCTAssertTrue(mockView.isSetResultLabelCalled)
    }
    
    func test_extraOperationsTapped_ifHasCurrentNumber_nilOperation_success() {
        // Given
        XCTAssertFalse(mockView.isSetResultLabelCalled)
        // When
        sut.extraOperationsTapped(operation: nil)
        // Then
        XCTAssertFalse(mockView.isSetResultLabelCalled)
    }
    
    func test_extraOperationsTapped_ifHasResultNumber_notNilOperation_success() {
        // Given
        let operation = "+"
        let firstGivenNumber = "3"
        let secondGivenNumber = "2"
        let givenExtraOperation = "cos"
        
        sut.numpadButtonTapped(title: firstGivenNumber)
        sut.basicOperationsTapped(operation: operation)
        
        sut.numpadButtonTapped(title: secondGivenNumber)
        sut.equalButtonTapped()
        // When
        sut.extraOperationsTapped(operation: givenExtraOperation)
        // Then
        XCTAssertTrue(mockView.isSetResultLabelCalled)
    }
    
    func test_clearButtonTapped_success() {
        // Given
        XCTAssertFalse(mockView.isSetResultLabelCalled)
        // When
        sut.clearButtonTapped()
        // Then
        XCTAssertTrue(mockView.isSetResultLabelCalled)
        XCTAssertFalse(sut.isOnTheFirstCalculation)
    }
    
    func test_equalButtonTapped_isCurrentOperationNotNil_success() {
        // Given
        let currentOperation = "+"
        sut.basicOperationsTapped(operation: currentOperation)
        XCTAssertFalse(mockView.isSetResultLabelCalled)
        // When
        sut.equalButtonTapped()
        // Then
        XCTAssertTrue(mockView.isSetResultLabelCalled)
    }
    
    func test_equalButtonTapped_isCurrentOperationNil_success() {
        // Given
        sut.basicOperationsTapped(operation: nil)
        XCTAssertFalse(mockView.isSetResultLabelCalled)
        // When
        sut.equalButtonTapped()
        // Then
        XCTAssertFalse(mockView.isSetResultLabelCalled)
    }
    
    func test_bitcoinButtonTapped_ifHasCurrentNumber_success() {
        // Given
        let givenNumber = "5"
        sut.numpadButtonTapped(title: givenNumber)
        XCTAssertFalse(mockView.isShowHUDCalled)
        XCTAssertFalse(mockInteractor.isGetConversionResultCalled)
        // When
        sut.bitcoinButtonTapped()
        // Then
        XCTAssertTrue(mockView.isShowHUDCalled)
        XCTAssertTrue(mockInteractor.isGetConversionResultCalled)
    }
    
    func test_bitcoinButtonTapped_ifHasResultNumber_success() {
        // Given
        let opereation = "+"
        let firstNumber = "5"
        let secondNumber = "3"
        
        sut.numpadButtonTapped(title: firstNumber)
        sut.basicOperationsTapped(operation: opereation)
        sut.numpadButtonTapped(title: secondNumber)
        sut.equalButtonTapped()
        XCTAssertFalse(mockView.isShowHUDCalled)
        XCTAssertFalse(mockInteractor.isGetConversionResultCalled)
        // When
        sut.bitcoinButtonTapped()
        // Then
        XCTAssertTrue(mockView.isShowHUDCalled)
        XCTAssertTrue(mockInteractor.isGetConversionResultCalled)
    }
    
    func test_didChangeValueOfSwitch_success() {
        // Given
        XCTAssertFalse(mockView.isUpdateUICalled)
        // When
        sut.didChangeValueOfSwitch(true)
        // Then
        XCTAssertTrue(mockView.isUpdateUICalled)
    }
}
