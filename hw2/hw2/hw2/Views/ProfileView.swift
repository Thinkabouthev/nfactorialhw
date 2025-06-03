import SwiftUI

struct ProfileView: View {
    @ObservedObject var userSession: UserViewModel

    var body: some View {
        if let user = userSession.currentUsers {
            VStack(spacing: 24) {
                Text("👤 Profile")
                    .font(.largeTitle)
                    .bold()
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Name:")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("\(user.firstName) \(user.lastName)")
                    }
                    
                    HStack {
                        Text("Nickname:")
                            .fontWeight(.semibold)
                        Spacer()
                        Text(user.nickname)
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)

                Button(action: {
                    userSession.logout()
                }) {
                    Label("Logout", systemImage: "arrow.backward.circle")
                        .font(.headline)
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
            }
            .padding()
        } else {
            VStack {
                Text("No user logged in")
                    .font(.headline)
                    .foregroundColor(.gray)
            }
            .padding()
        }
    }
}
