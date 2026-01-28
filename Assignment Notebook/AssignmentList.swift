//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by Tom Bredemeier on 1/28/26.
//

import Foundation

@Observable
class AssignmentList {
    var items =
    [AssignmentItem(course: "Algebra", description: "Linear Equation", dueDate: Date()),
     AssignmentItem(course: "History", description: "Civil War Paper", dueDate: Date()),
     AssignmentItem(course: "Science", description: "Atomic Bomb Lab", dueDate: Date())]
}
