import XCTest

final class iOSAppUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    @MainActor
    func testLaunchToHomeScreen() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Wait for the greeting button to appear
        XCTAssertTrue(app.buttons["Greet"].waitForExistence(timeout: 2))
        
        // Take screenshot after the UI stabilizes
        let screenshot = app.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = "Home Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
