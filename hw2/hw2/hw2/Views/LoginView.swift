import SwiftUI

struct LoginView: View {
    @ObservedObject var userSession: UserViewModel
    
    @State private var nickname: String = ""
    @State private var password: String = ""
    @State private var loginFailed = false
    var body: some View {
        VStack {
            Text("Login")
                .font(.headline)
            
            TextField("Nickname", text: $nickname)
                .textFieldStyle(.roundedBorder)
            
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
            Button("login"){
                let success = userSession.login(nickname: nickname, password: password)
                loginFailed = !success
            }
            if loginFailed {
                            Text("something went wrong")
                                .foregroundColor(.red)
                        }
            NavigationLink("Don't have an account? Register", destination: RegisterView(userSession: userSession))
        }
        .padding()
    }
    
}
