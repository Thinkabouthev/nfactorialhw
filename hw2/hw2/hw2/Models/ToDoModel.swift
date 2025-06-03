import SwiftUI

struct ToDoModel: Identifiable, Codable{
    var id = UUID()
    var title: String
    var isDone: Bool
}
