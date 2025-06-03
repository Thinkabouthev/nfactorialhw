import SwiftUI

@main
struct hw2App: App {
    @StateObject private var toDoVM = ToDoViewModel()
    @StateObject private var userSession = UserViewModel()

    init() {
        userSession.loadUsers()
    }

    var body: some Scene {
        WindowGroup {
            ContentView(toDoVM: toDoVM, userSession: userSession)
        }
    }
}
