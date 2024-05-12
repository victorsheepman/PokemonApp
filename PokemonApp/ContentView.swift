//
//  ContentView.swift
//  PokemonApp
//
//  Created by Victor Marquez on 9/5/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, dev!")
            
            Button("Fetch Data"){
                viewModel.getDataModel()
            }
        }
    }
}

#Preview {
    ContentView()
}
