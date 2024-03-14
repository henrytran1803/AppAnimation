//
//  ListUserView.swift
//  AppAnimation
//
//  Created by Tran Viet Anh on 14/03/2024.
//


import SwiftData
import SwiftUI

struct ListUserView: View {
    @Query var users: [User]
    @Environment(\.modelContext) var modelContext
    @State private var sortOrder = SortDescriptor(\User.name)
    var body: some View {
        List {
            ForEach(users) { user in
                NavigationLink(value: user) {
                    Text("\(user.name) is \(user.date) years old")
                }
            }
            .onDelete(perform: deleteUser)
        }
    }
    init(sort: SortDescriptor<User>, searchString: String) {
        _users = Query(filter: #Predicate {
            if searchString.isEmpty {
                return true
            } else {
                return $0.name.localizedStandardContains(searchString)
            }
        }, sort: [sort])
    }
    func deleteUser(_ indexSet: IndexSet) {
        for item in indexSet {
            let object = users[item]
            modelContext.delete(object)
        }
    }
}
#Preview {
    ListUserView(sort: SortDescriptor(\User.name), searchString: "")
}
