//
//  TodoItem.swift
//  ToDoApp
//
//  Created by 吉瀬亮太 on 2026/09/13.
//

import SwiftUI

enum Priority: Int, Codable, CaseIterable, Identifiable {
    case low, medium, high

    var id: Int { rawValue }

    var label: String {
        switch self {
        case .low: return "低"
        case .medium: return "中"
        case .high: return "高"
        }
    }
}

enum RepeatRule: Codable, Equatable {
    case none
    case daily
    case weekdays
    case weekly(weekday: Int)
}

struct Subtask: Identifiable, Codable, Equatable {
    let id: UUID
    var title: String
    var isDone: Bool

    init(id: UUID = UUID(), title: String, isDone: Bool = false) {
        self.id = id
        self.title = title
        self.isDone = isDone
    }
}

struct PriorityTestView: View {
    var body: some View {
        VStack {
            ForEach(Priority.allCases) { p in
                Text(p.label)
            }
        }
    }
}

struct TodoItem: Identifiable, Codable, Equatable {
    let id: UUID
    var title: String
    var isDone: Bool
    var priority: Priority
    var repeatRule: RepeatRule
    var dueDate: Date?
    var subtasks: [Subtask]
    var createdAt: Date

    init(
        id: UUID = UUID(),
        title: String,
        isDone: Bool = false,
        priority: Priority = .medium,
        repeatRule: RepeatRule = .none,
        dueDate: Date? = nil,
        subtasks: [Subtask] = [],
        createdAt: Date = Date()
    ) {
        self.id = id
        self.title = title
        self.isDone = isDone
        self.priority = priority
        self.repeatRule = repeatRule
        self.dueDate = dueDate
        self.subtasks = subtasks
        self.createdAt = createdAt
    }
}
