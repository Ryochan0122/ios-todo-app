import SwiftUI

struct ContentView: View {
    @StateObject private var store = TodoStore()
    @State private var newTitle = ""

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("新しいタスク", text: $newTitle)
                        .textFieldStyle(.roundedBorder)
                    Button("追加") {
                        guard !newTitle.isEmpty else { return }
                        store.addTodo(TodoItem(title: newTitle))
                        newTitle = ""
                    }
                }
                .padding()

                List {
                    ForEach(store.todos) { todo in
                        HStack {
                            Text(todo.title)
                                .strikethrough(todo.isDone)
                            Spacer()
                            Text(todo.priority.label)
                        }
                        .onTapGesture {
                            store.toggleDone(todo)
                        }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            store.deleteTodo(store.todos[index])
                        }
                    }
                }
            }
            .navigationTitle("TODOリスト")
        }
    }
}

#Preview {
    ContentView()
}
