import XCTest

final class iOSAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    @MainActor
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
    
    @MainActor
    func testGreetingButtonShowsAlert() throws {
        let app = XCUIApplication()
        app.launch()

        let greetButton = app.buttons["Greet"]
        XCTAssertTrue(greetButton.exists, "The Greet button should exist.")
        
        greetButton.tap()

        let greetingAlert = app.alerts["Greeting"]
        XCTAssertTrue(greetingAlert.waitForExistence(timeout: 2), "Greeting alert should appear.")

        XCTAssertTrue(greetingAlert.staticTexts["Hello, user!"].exists)
    }
}
