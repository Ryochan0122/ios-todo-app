//
//  TodoStore.swift
//  ToDoApp
//
//  Created by 吉瀬亮太 on 2026/09/14.
//
import Foundation
import Combine

@MainActor
class TodoStore: ObservableObject {
    @Published var todos: [TodoItem] = []

    private let saveKey = "todos"

    init() {
        load()
    }

    func addTodo(_ todo: TodoItem) {
        todos.append(todo)
        save()
    }

    func toggleDone(_ todo: TodoItem) {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index].isDone.toggle()
            save()
        }
    }

    func deleteTodo(_ todo: TodoItem) {
        todos.removeAll { $0.id == todo.id }
        save()
    }

    private func save() {
        if let data = try? JSONEncoder().encode(todos) {
            UserDefaults.standard.set(data, forKey: saveKey)
        }
    }

    private func load() {
        if let data = UserDefaults.standard.data(forKey: saveKey),
           let decoded = try? JSONDecoder().decode([TodoItem].self, from: data) {
            todos = decoded
        }
    }
}
