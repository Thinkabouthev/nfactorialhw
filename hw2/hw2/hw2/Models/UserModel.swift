import SwiftUI

struct UserModel: Identifiable, Codable, Equatable {
    var id = UUID()
    var firstName: String
    var lastName: String
    var nickname: String
    var password: String
}
