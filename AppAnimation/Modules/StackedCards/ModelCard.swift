//
//  ModelCard.swift
//  AppAnimation
//
//  Created by Tran Viet Anh on 14/03/2024.
//

import Foundation
import SwiftUI


struct Card : Identifiable{
    let id: UUID = .init()
    var color: Color
}

var card:[Card] = [.init(color: .blue), .init(color: .black) ,.init(color: .purple),.init(color: .pink), .init(color: .green)]
