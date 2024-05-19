//
//  PokemonAppApp.swift
//  PokemonApp
//
//  Created by Victor Marquez on 9/5/24.
//

import SwiftUI

@main
struct PokemonAppApp: App {
    @ObservedObject var router = Router()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(router)
        }
    }
}
