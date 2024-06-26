//
//  ContentView.swift
//  PokemonApp
//
//  Created by Victor Marquez on 9/5/24.
//

import SwiftUI

enum SearchByEnum: String {
    case number = "number"
    case name   = "name"
}

struct ContentView: View {
    @StateObject var viewModel = HomeViewModel()
    @State var searchText: String = ""
    @State private var searchBy: SearchByEnum = .name
    var filteredPokemons: [PokemonDataModel] {
        
        if searchBy == .name {
            guard !searchText.isEmpty else { return viewModel.pokemons }
            
            return viewModel.pokemons.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }else {
            return viewModel.pokemons
        }
        
    }
    
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("Color/Primary").edgesIgnoringSafeArea(.all)
                VStack{
                    headerTitle
                    HStack(spacing:16) {
                        TextField("search", text: $searchText)
                            .padding(.leading, 36)
                            .frame(width:360, height: 42)
                            .background(.white)
                            .foregroundStyle(Color("Color/MediumGray"))
                            .cornerRadius(26)
                            .overlay(alignment: .leading){
                                Image("search")
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                    .padding(.leading,12)
                                    .foregroundColor(Color("Color/Primary"))
                            }
                    }
                    cardList
                }.padding(.horizontal, 12)
                   
            }.onAppear{
                viewModel.fetchData()
            }
            
        }
    }
    
    var headerTitle: some View {
        HStack(spacing:12){
            Image("Pokeball")
                .renderingMode(.template)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(.white)
            Text("Pokédex")
                .fontWeight(.bold)
                .font(.system(size: 32))
                .foregroundStyle(.white)
            Spacer()
        }
    }
    
    var cardList: some View{
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: layout,spacing: 12){
                ForEach(filteredPokemons, id:\.name){ pokemon in
                    NavigationLink(destination: PokemonDetailView(url: pokemon.url)) {
                       PokemonCardView(pokemon: pokemon)
                    }
                }
            }.padding(.bottom, 65)
             .padding(.top,15)
        }
    }
}

#Preview {
    ContentView()
}
