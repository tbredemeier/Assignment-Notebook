//
//  AddAssignmentView.swift
//  Assignment Notebook
//
//  Created by Tom Bredemeier on 1/28/26.
//

import SwiftUI

struct AddAssignmentView: View {
    @Environment(AssignmentList.self) var assignmentList
    @Environment(\.dismiss) var dismiss
    static let courses = ["Math", "Mobile Apps", "Science", "History", "Art", "Music"]
    @State private var course = ""
    @State private var description = ""
    @State private var dueDate = Date()
    var body: some View {
        NavigationView {
            Form {
                Picker("Course", selection: $course) {
                    ForEach(Self.courses, id: \.self) { course in
                        Text(course)
                    }
                }
            }
        }
    }
}

