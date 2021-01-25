//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by Tom Bredemeier on 1/25/21.
//

import Foundation

class AssignmentList: ObservableObject {
    @Published var items : [Assignment] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "data")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "data") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ToDoItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        items = []
    }
 }
