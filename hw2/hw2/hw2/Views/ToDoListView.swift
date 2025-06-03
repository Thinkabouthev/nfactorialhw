import SwiftUI

struct ToDoListView: View{
    @ObservedObject var toDoVM: ToDoViewModel
    @ObservedObject var userSession: UserViewModel
    
    @State private var newToDoTitle = ""
    
    var body: some View{
        VStack {
            Text("ToDo List")
            
            List {
                ForEach(toDoVM.toDos) { todo in
                    HStack {
                        Text(todo.title)
                        Spacer()
                        Image(systemName: todo.isDone ? "checkmark.circle.fill" : "circle")
                            .onTapGesture {
                                toDoVM.toggleTodo(todo)
                            }
                    }
                }
                .onDelete(perform: toDoVM.removeItem)
            }
            HStack {
                TextField("New Todo", text: $newToDoTitle)
                    .textFieldStyle(.roundedBorder)
                Button("Add") {
                    toDoVM.addToDo(title: newToDoTitle)
                    newToDoTitle = ""
                }
            }
            .padding()
        }
    }
}

