//
//  SwiftDataView.swift
//  AppAnimation
//
//  Created by Tran Viet Anh on 14/03/2024.
//

import SwiftUI
import SwiftData
struct SwiftDataView: View {
    
    @Environment (\.modelContext) var modelContext
    @Query(sort: \User.name) var users: [User]
    @State private var path = [User]()
    @State private var sortOrder = SortDescriptor(\User.name)
    @State private var searchText = ""
    var body: some View{
        NavigationStack (path: $path){
            ListUserView(sort: sortOrder, searchString: searchText)
                .navigationTitle("iTour")
                .navigationDestination(for: User.self, destination: UserView.init)
                .toolbar {
                    Button("Add Samples", action: addUser)
                    
                    Menu("Sort") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Name")
                                .tag(SortDescriptor(\User.name))
                            
                            Text("date")
                                .tag(SortDescriptor(\User.date))
                         
                        }
                        .pickerStyle(.inline)
                    }
                }
                .searchable(text: $searchText)
        }
    }

    func addSample(){
        
        let rome = User(name: "Rome")
          let florence = User(name: "Florence")
          let naples = User(name: "Naples")
        modelContext.insert(rome)
        modelContext.insert(florence)
        modelContext.insert(naples)
    }
    func addUser(){
        let add = User()
        modelContext.insert(add)
        path = [add]
    }
    func deleteSet (_ indexSet: IndexSet){
        for index in indexSet{
            let user = users[index]
            modelContext.delete(user)
        }
    }
 
}

#Preview {
    SwiftDataView()
}
