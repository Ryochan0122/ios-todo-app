//
//  TodoItemTest.swift
//  ToDoApp
//
//  Created by 吉瀬亮太 on 2026/09/14.
//
import XCTest
@testable import ToDoApp

final class TodoItemTests: XCTestCase {
    func testEncodeDecode() throws {
        let item = TodoItem(title: "参考書10p", priority: .high, subtasks: [Subtask(title: "p1-10")])
        let data = try JSONEncoder().encode(item)
        let decoded = try JSONDecoder().decode(TodoItem.self, from: data)
        XCTAssertEqual(item, decoded)
    }
}
