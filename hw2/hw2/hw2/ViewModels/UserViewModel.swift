import SwiftUI
import Foundation

class UserViewModel: ObservableObject {
    @Published var users: [UserModel] = []
    @Published var currentUsers: UserModel?
    
    func registerUser(firstName: String, lastName: String, nickname: String, password: String){
        let newUser = UserModel(id: UUID(), firstName: firstName, lastName: lastName, nickname: nickname, password: password)
        users.append(newUser)
        currentUsers = newUser
        saveUsers()
    }
    func login(nickname: String, password: String) -> Bool{
        if let user = users.first(where: {$0.nickname == nickname && $0.password == password}){
            currentUsers = user
            return true
        }
            return false
    }
    
    func logout(){
        currentUsers = nil
    }

    func saveUsers(){
        if let encoded = try? JSONEncoder().encode(users) {
            UserDefaults.standard.set(encoded, forKey: "SavedUsers")
        }
    }
    
    func loadUsers() {
            if let data = UserDefaults.standard.data(forKey: "SavedUsers"),
               let decoded = try? JSONDecoder().decode([UserModel].self, from: data) {
                users = decoded
            }
        }
}
