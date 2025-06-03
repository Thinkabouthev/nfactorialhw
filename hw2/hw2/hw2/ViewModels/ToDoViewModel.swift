import SwiftUI

class ToDoViewModel: ObservableObject {
    @Published var toDos: [ToDoModel] = []
    
    func addToDo(title: String){
        let newToDo = ToDoModel(id: UUID(), title: title, isDone: false)
        toDos.append(newToDo)
    }
    func removeItem(at indexSet: IndexSet) {
            toDos.remove(atOffsets: indexSet)
        }
    
    func toggleTodo(_ todo: ToDoModel) {
            if let index = toDos.firstIndex(where: { $0.id == todo.id }) {
                toDos[index].isDone.toggle()
            }
        }
}
