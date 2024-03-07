//
//  BasicView.swift
//  AppAnimation
//
//  Created by Tran Viet Anh on 07/03/2024.
//

import SwiftUI

struct BasicView: View {
    @State var isHighLight = false
    @State private var animationAmount = 1.0
    var body: some View {
        HStack{
            Image(systemName: "person.crop.circle.badge.exclamationmark")
            Text("Error")
            Spacer()
            Text("Focus")
                .foregroundStyle(.secondary)
        }   
            .padding()
            .background(.thinMaterial)
            .cornerRadius(20)
            .opacity(isHighLight ? 1 : 0.5)
            .foregroundColor(isHighLight ? .red : .primary)
            .animation(.easeInOut(duration: 1.0).repeatForever(),value: isHighLight)
            .onAppear{
                isHighLight.toggle()
            }
        Divider().frame(height: 5)
            .background(.black)
            .padding()
        HStack{
            Image(systemName: "person.crop.circle.badge.exclamationmark")
            Text("Error")
            Spacer()
            Text("Focus")
                .foregroundStyle(.secondary)
        }
            .padding()
            .background(.thinMaterial)
            .cornerRadius(20)
            .phaseAnimator([true, false]){content, phase in content
                
                    .opacity(phase ? 1 : 0.5)
                    .foregroundColor(phase ? .red : .primary)
            } animation: { phase in
                    .easeInOut(duration: 1)
            }
        Divider().frame(height: 5)
            .background(.black)
            .padding()
        HStack{
            Image(systemName: "person.crop.circle.badge.exclamationmark")
            Text("Error")
            Spacer()
            Text("Focus")
                .foregroundStyle(.secondary)
        }
            .padding()
            .background(.thinMaterial)
            .cornerRadius(20)
            .phaseAnimator([true, false]){content, phase in content
                
                    .opacity(phase ? 1 : 0.5)
                    .foregroundColor(phase ? .red : .primary)
            } animation: { phase in
                    .spring(duration: 1, bounce: 0.9)
                    
            }
//        Button("Tap Me") {
//                   animationAmount += 1
//               }
//               .padding(50)
//               .background(.red)
//               .foregroundStyle(.white)
//               .clipShape(.circle)
//               .scaleEffect(animationAmount)
//               .animation(.easeInOut(duration: 2), value: animationAmount)
//               .overlay(
//                   Circle()
//                       .stroke(.red)
//                       .scaleEffect(animationAmount)
//                       .opacity(2 - animationAmount)
//               )
//               .overlay(
//                   Circle()
//                       .stroke(.red)
//                       .scaleEffect(animationAmount)
//                       .opacity(2 - animationAmount)
//                       .animation(
//                           .easeOut(duration: 1)
//                               .repeatForever(autoreverses: false),
//                           value: animationAmount
//                       )
//               )
//               .overlay(
//                   Circle()
//                       .stroke(.red)
//                       .scaleEffect(animationAmount)
//                       .opacity(2 - animationAmount)
//                       .animation(
//                           .easeInOut(duration: 1)
//                               .repeatForever(autoreverses: false),
//                           value: animationAmount
//                       )
//               )
//               .onAppear {
//                   animationAmount = 2
//               }
        
    }
}

#Preview {
    BasicView()
}
