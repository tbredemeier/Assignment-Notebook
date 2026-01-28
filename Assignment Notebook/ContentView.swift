//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Tom Bredemeier on 1/27/26.
//

import SwiftUI

struct ContentView: View {
    @State private var assignmentList = AssignmentList()
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentList.items) { item in
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
                    assignmentList.items.move(fromOffsets: indices, toOffset: newOffset)
                }
                .onDelete(perform: { indexSet in
                    assignmentList.items.remove(atOffsets: indexSet)
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
