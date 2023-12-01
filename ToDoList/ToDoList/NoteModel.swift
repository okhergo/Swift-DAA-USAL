//
//  NoteModel.swift
//  ToDoList
//
//  Created by Óscar Khergo on 20/10/23.
//

import Foundation

struct NoteModel: Codable {
    let id: String
    var isFavorited: Bool
    let description: String
    
    init(id: String = UUID().uuidString, isFavorited: Bool = false, description: String) {
        self.id = id
        self.isFavorited = isFavorited
        self.description = description 
    }
}
