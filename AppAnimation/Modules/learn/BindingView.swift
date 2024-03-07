//
//  BindingView.swift
//  AppAnimation
//
//  Created by Tran Viet Anh on 07/03/2024.
//

import SwiftUI

struct BindingView: View {
    @State private var isShowing = false
    var body: some View {
        BindingTest(isShowing: $isShowing)
    }
}
struct BindingTest: View {
    @Binding var isShowing : Bool
    var body: some View {
        Button(action: {isShowing.toggle()}, label: {
            Text(isShowing ? "Long text" : "Short")
        }).padding()
            .background(.secondary)
            .cornerRadius(12)
            .foregroundColor(.blue)
            .animation(.easeInOut(duration: 1),value: isShowing)
    }
}
#Preview {
    BindingView()
}
