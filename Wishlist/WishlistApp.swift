//
//  WishlistApp.swift
//  Wishlist
//
//  Created by Preeteesh Remalli on 04/01/26.
//

import SwiftUI
import SwiftData

@main
struct WishlistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Wish.self)
        }
    }
}
