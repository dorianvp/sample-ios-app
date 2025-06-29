import Foundation

struct AppLogic {
    static func greetUser(name: String) -> String {
        "Hello, \(name)!"
    }

    static func runExternalStub() -> String {
        "[External] Stubbed result."
    }
}
