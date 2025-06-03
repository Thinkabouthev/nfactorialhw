import SwiftUI

struct TabBarView: View {
    @ObservedObject var toDoVM: ToDoViewModel
    @ObservedObject var userSession: UserViewModel
    
    var body: some View {
        TabView{
            ToDoListView(toDoVM: toDoVM, userSession: userSession)
                .tabItem {
                    Label("home", systemImage: "house")
                }
            ProfileView(userSession: userSession)
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}
