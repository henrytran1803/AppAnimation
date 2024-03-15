//
//  BottomSheetView.swift
//  AppAnimation
//
//  Created by Tran Viet Anh on 14/03/2024.
//

import SwiftUI
 
struct BottomSheetView: View {
    @State var isShowingBottom = false
    var body: some View {
        VStack{
            
            Button(action: {isShowingBottom = true}, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
        }.sheet(isPresented: $isShowingBottom, content: {
            MainBottomView()
                .presentationDetents([.medium,.large])
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(20)
                
        })
    }
}

#Preview {
    BottomSheetView()
}
