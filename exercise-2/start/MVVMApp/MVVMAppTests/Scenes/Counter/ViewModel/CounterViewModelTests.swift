import XCTest
@testable import Start_MVVMApp_2

final class CounterViewModelTests: XCTestCase {
    
    private var viewModel: CounterViewModel!
    private var numberService: NumberServiceMock!
    
    override func setUp() {
        super.setUp()
        
        numberService = NumberServiceMock()
        viewModel = CounterViewModel(numberService: numberService)
    }
    
    func test_whenMinusButtonTap_thenCounterShouldDecrement() {
        
        // Given
        let expectation = self.expectation(description: "Counter should decrement")
        var result: String?
        
        viewModel.countText.bind = { countText in
            result = countText
            expectation.fulfill()
        }
        
        // When
        viewModel.onMinusButtonTap()
        
        waitForExpectations(timeout: 1, handler: nil)
        
        // Then
        XCTAssertEqual(result, "-1")
    }
    
    func test_whenMinusButtonTap_whenCounterIsZero_thenCounterShouldStayZero() {
        
        // Given
        let expectation = self.expectation(description: "Bonus spec: Counter should stay to zero")
        var result: String?
        
        viewModel.countText.bind = { countText in
            result = countText
            expectation.fulfill()
        }
        
        // When
        viewModel.onMinusButtonTap()
        
        waitForExpectations(timeout: 1, handler: nil)
        
        // Then
        XCTAssertEqual(result, "0")
    }
    
    func test_whenPlusButtonTap_thenCounterShouldIncrement() {
        
        // Given
        let expectation = self.expectation(description: "Counter should increment")
        var result: String?
        
        viewModel.countText.bind = { countText in
            result = countText
            expectation.fulfill()
        }
        
        // When
        viewModel.onPlusButtonTap()
        
        waitForExpectations(timeout: 1, handler: nil)
        
        // Then
        XCTAssertEqual(result, "1")
    }
    
    func test_whenRandomButtonTap_thenCounterShouldBeRandom() {
        
        // Given
        numberService.randomNumber = 42
        
        let expectation = self.expectation(description: "Counter should be 42")
        var result: String?
        
        viewModel.countText.bind = { countText in
            result = countText
            expectation.fulfill()
        }
        
        // When
        viewModel.onRandomButtonTap()
        
        waitForExpectations(timeout: 1, handler: nil)
        
        // Then
        XCTAssertEqual(result, "42")
    }
}
