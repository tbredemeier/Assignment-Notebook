//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Tom Bredemeier on 1/27/26.
//

import SwiftUI

struct ContentView: View {
    @State private var assignmentItems =
    [AssignmentItem(course: "Algebra", description: "Linear Equation", dueDate: Date()),
     AssignmentItem(course: "History", description: "Civil War Paper", dueDate: Date()),
     AssignmentItem(course: "Science", description: "Atomic Bomb Lab", dueDate: Date())]
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentItems) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.course)
                                .font(.headline)
                            Text(item.description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Text(item.dueDate, style: .date)
                    }
                }
                .onMove { indices, newOffset in
                    assignmentItems.move(fromOffsets: indices, toOffset: newOffset)
                }
                .onDelete(perform: { indexSet in
                    assignmentItems.remove(atOffsets: indexSet)
                })
            }
            .navigationBarTitle("Assignment Notebook", displayMode: .inline)
            .navigationBarItems(leading: EditButton())
        }
    }
}

#Preview {
    ContentView()
}

struct AssignmentItem: Identifiable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
}
