import SwiftUI

struct RegisterView: View {
    @ObservedObject var userSession: UserViewModel
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var nickname: String = ""
    @State private var password: String = ""
    var body: some View {
        VStack {
            Text("Register^^")
                .font(.title)
            TextField("First Name", text: $firstName)
            TextField("Last Name", text: $lastName)
            TextField("Nickname", text: $nickname)
            SecureField("Password", text: $password)
            Button("Register"){
                userSession.registerUser(
                        firstName: self.firstName,
                        lastName: self.lastName,
                        nickname: self.nickname,
                        password: self.password
                    )
            }
        }
        .padding()
    }
}
