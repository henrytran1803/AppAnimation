//
//  StackedCard.swift
//  AppAnimation
//
//  Created by Tran Viet Anh on 14/03/2024.
//

import SwiftUI

struct StackedCard: View {
    
    @State var isRoted:Bool = false
    @State var showIndicator:Bool = false
    var body: some View {
        NavigationStack{
            VStack{
                GeometryReader{
                    
                    let size = $0.size

                    ScrollView(.horizontal){
                        HStack(spacing: 0){
                            ForEach(card){car in
                                CardView(car)
                                    .padding(.horizontal,65)
                                    .frame(width: size.width)
                                    .visualEffect { content, geometryProxy in
                                        content.offset(x: minX(geometryProxy))
                                    }
                            
                                
                            }
                        }
                        
                        
                    }
                    .scrollTargetBehavior(.paging)
                    //.scrollIndicators($showIndicator? .visible : .hidden)
                }.frame(height: 380)
            }
            .navigationTitle("StackedCard")
        }
    }
    
    @ViewBuilder
    func CardView(_ card: Card) -> some View{
        RoundedRectangle(cornerRadius: 20)
            .fill(card.color.gradient)
    }
    
    func minX(_ proxy : GeometryProxy) -> CGFloat {
        return 0
    }
}

#Preview {
    StackedCard()
}
