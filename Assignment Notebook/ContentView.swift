//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Tom Bredemeier on 2/1/24.
//

import SwiftUI

struct ContentView: View {
    @State private var assignmentItems = [AssignmentItem(course: "Math", description: "Unit Test", date: Date()),
    AssignmentItem(course: "English", description: "Term Paper", date: Date())]
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentItems) {item in
                    HStack {
                        VStack {
                            Text(item.course)
                                .font(.headline)
                            Text(item.description)
                        }
                        Spacer()
                        Text(item.date, style: .date)
                    }
                }
                .onMove(perform: { indices, newOffset in
                    assignmentItems.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    assignmentItems.remove(atOffsets: indexSet)
                })
            }
            .navigationBarTitle("Assignments", displayMode: .inline)
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
    var date = Date()
}
