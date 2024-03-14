//
//  AppAnimationApp.swift
//  AppAnimation
//
//  Created by Tran Viet Anh on 04/03/2024.
//

import SwiftUI
import SwiftData

@main
struct AppAnimationApp: App {
    var body: some Scene {
        WindowGroup {
            SwiftDataView()
        }
        .modelContainer(for: User.self)
    }
}
