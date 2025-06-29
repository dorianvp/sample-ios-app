import Testing
@testable import iOSApp

struct iOSAppTests {

    @Test func greetUser_returnsCorrectGreeting() async throws {
        let result = AppLogic.greetUser(name: "Dario")
        #expect(result == "Hello, Dario!")
    }

    @Test func runExternalStub_returnsStub() async throws {
        let result = AppLogic.runExternalStub()
        #expect(result.contains("Stubbed"))
    }

}
