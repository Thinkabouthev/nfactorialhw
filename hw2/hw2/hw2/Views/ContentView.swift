import SwiftUI

struct ContentView: View {
    @ObservedObject var toDoVM: ToDoViewModel
    @ObservedObject var userSession: UserViewModel

    var body: some View {
        NavigationView {
            if userSession.currentUsers == nil {
                LoginView(userSession: userSession)
            } else {
                TabBarView(toDoVM: toDoVM, userSession: userSession)
            }
        }
    }
}
#Preview {
    ContentView(
        toDoVM: ToDoViewModel(),
        userSession: UserViewModel()
    )
}

