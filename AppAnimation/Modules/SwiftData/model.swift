//
//  model.swift
//  AppAnimation
//
//  Created by Tran Viet Anh on 14/03/2024.
//

import Foundation
import SwiftData

@Model
class User  {
    let id: UUID
    var name: String
    var date :Date
    @Relationship(deleteRule: .cascade) var cart = [Cart]()
    init(id:UUID = UUID(),name: String = "", date: Date = .now) {
        self.id = id
        self.name = name
        self.date = date
    }
  
   
}

@Model
class Cart {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    
}
