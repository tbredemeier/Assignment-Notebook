//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Tom Bredemeier on 1/25/21.
//

import SwiftUI
@ObservedObject var assignmentList = AssignmentList()
@State private var showingAddView = false

struct ContentView: View {
        var body: some View {
            NavigationView {
                List {
                    ForEach(assignmentList.items) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.priority)
                                    .font(.headline)
                                Text(item.description)
                            }
                            Spacer()
                            Text(item.dueDate, style: .date)
                        }
                    }
                    .onMove(perform: { indices, newOffset in
                        assignmentList.items.move(fromOffsets: indices, toOffset: newOffset)
                    })
                    .onDelete(perform: { indexSet in
                        assignmentList.items.remove(atOffsets: indexSet)
                    })
                }
                .sheet(isPresented: $showingAddView, content: {
                    AddView(assignmentList: assignmentList)
                })
                .navigationBarTitle("Assignment List")
                .navigationBarItems(leading: EditButton(),
                                    trailing: Button(action: {
                                        showingAddView = true}) {
                                        Image(systemName: "plus")
                })
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Assignment: Identifiable, Codable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
}
