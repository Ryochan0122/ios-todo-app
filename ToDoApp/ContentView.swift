import SwiftUI

struct ContentView: View {
    @StateObject private var store = TodoStore()
    @State private var newTitle = ""
    @State private var selectedPriority: Priority = .medium

    var body: some View {
        NavigationStack {
            VStack {
                VStack(spacing: 8) {
                    HStack {
                        TextField("新しいタスク", text: $newTitle)
                            .textFieldStyle(.roundedBorder)
                        Button("追加") {
                            guard !newTitle.isEmpty else { return }
                            store.addTodo(TodoItem(title: newTitle, priority: selectedPriority))
                            newTitle = ""
                            selectedPriority = .medium
                        }
                    }
                    
                    Picker("重要度", selection: $selectedPriority) {
                        ForEach(Priority.allCases) { priority in
                            Text(priority.label).tag(priority)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .padding()
                
                List {
                    ForEach(store.todos.sorted(by: { $0.priority.rawValue > $1.priority.rawValue })) { todo in
                        HStack {
                            Circle()
                                .fill(todo.priority.color)
                                .frame(width: 10, height: 10)
                            Text(todo.title)
                                .strikethrough(todo.isDone)
                            Spacer()
                            Text(todo.priority.label)
                                .foregroundStyle(todo.priority.color)
                        }
                        .onTapGesture {
                            store.toggleDone(todo)
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                store.deleteTodo(todo)
                            } label: {
                                Label("削除", systemImage: "trash")
                            }
                        }
                    }
                }
                .navigationTitle("TODOリスト")
            }
        }
    }
}
    

#Preview {
    ContentView()
}

