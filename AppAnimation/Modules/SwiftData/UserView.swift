//
//  UserView.swift
//  AppAnimation
//
//  Created by Tran Viet Anh on 14/03/2024.
//
//
import SwiftUI
import SwiftData


struct UserView: View {
    @Bindable var user: User
    @State private var newCart = ""
    var body: some View {
        Form {
            Text("\(user.id)")
            TextField("Name", text: $user.name)
            DatePicker("Date", selection: $user.date)
                .labelsHidden()
                .listRowSeparator(.hidden)
            Section("Cart"){
                ForEach(user.cart){car in
                    Text("\(car.name)")
                    
                }
                TextField("", text: $newCart)
                Button("add",action: addCart)
            }
        }
    }
    func addCart(){
        guard newCart.isEmpty == false else {return}
        
        withAnimation {
            
            let cart = Cart(name: newCart)
            user.cart.append(cart)
            newCart = ""
            
        }
    }
}

#Preview {
    do{
        let cofig = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: cofig)
        let user = User(name: "anh")
        return  UserView(user: user)
            .modelContainer(container)
    }
    catch{
        fatalError("fail to create")
    }
    
}
