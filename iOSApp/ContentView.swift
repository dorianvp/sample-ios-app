import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var localCount = 0
    @State private var externalResult = "Tap to run external logic"

    @State private var showGreetingAlert = false
    @State private var greetingMessage = ""
    
    var body: some View {
        NavigationStack {
            List {
                Section("Local Swift Logic") {
                    HStack {
                        Text("Count: \(localCount)")
                        Spacer()
                        Button("Increment") {
                            localCount += 1
                        }
                    }

                    Button("Greet") {
                        greetingMessage = AppLogic.greetUser(name: "user")
                        showGreetingAlert = true
                    }
                }

                Section("External Library Logic") {
                    Button("Run External Op") {
                        externalResult = AppLogic.runExternalStub()
                    }
                    Text(externalResult)
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("Swift + External")
            .alert("Greeting", isPresented: $showGreetingAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(greetingMessage)
            }
        }
    }
}

#Preview {
    ContentView()
}
