//
//  SwiftUIView.swift
//  AppAnimation
//
//  Created by Tran Viet Anh on 07/03/2024.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var scaleRotate = false
    @State private var thumbsCount = 0
    
    var body: some View {
        Button {
            withAnimation(.interpolatingSpring(
                stiffness: 170, damping: 10)) {
                    scaleRotate.toggle()
                } completion: {
                    withAnimation(.bouncy(extraBounce: 0.4)) {
                        scaleRotate = false
                    }
                }
            
        } label: {
            Text("👍")
                .rotationEffect(.degrees(scaleRotate ? -45 : 0), anchor: .bottomLeading)
                .scaleEffect(scaleRotate ? 1.5 : 1)
        }
    }
}

#Preview {
    SwiftUIView()
}
