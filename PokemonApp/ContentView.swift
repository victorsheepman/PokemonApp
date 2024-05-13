//
//  ContentView.swift
//  PokemonApp
//
//  Created by Victor Marquez on 9/5/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = HomeViewModel()
    @State var searchText: String = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("Color/Primary").edgesIgnoringSafeArea(.all)
             
            }
        }
            
    }
}

#Preview {
    ContentView()
}
