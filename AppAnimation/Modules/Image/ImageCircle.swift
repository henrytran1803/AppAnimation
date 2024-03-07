//
//  ImageCircle.swift
//  AppAnimation
//
//  Created by Tran Viet Anh on 07/03/2024.
//

import SwiftUI

struct ImageCircle: View {
    var body: some View {
        Image("Image")
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.gray, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    ImageCircle()
}
