//
//  ContentView.swift
//  PokemonApp
//
//  Created by Victor Marquez on 9/5/24.
//

import SwiftUI

struct ContentView: View {

    @StateObject var viewModel = PokemonListOO()
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("Color/Primary").edgesIgnoringSafeArea(.all)
                VStack{
                    HStack(spacing:12){
                        headerTitle
                        Spacer()
                    }
                    searchBar
                    cardList
                }.padding(.horizontal, 12)
                
            }
        }
    }
    
    var cardList: some View{
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: Constansts.layout, spacing: 12){
                ForEach(viewModel.filteredPokemons, id:\.name){ pokemon in
                    NavigationLink(destination: PokemonDetailView(url: pokemon.url)) {
                       PokemonCardView(pokemon: pokemon)
                    }
                }
            }
            .padding(.bottom, 65)
            .padding(.top,15)
        }
    }
    
    var headerTitle: some View {
        Group {
            Image("Pokeball")
                .renderingMode(.template)
                .resizable()
                .frame(width: 24, height: 24)
            
            Text("Pokédex")
                .font(.system(size: 32).bold())
        }.foregroundColor(.white)
    }
    
    var searchBar: some View {
        TextField("search", text: $viewModel.searchText)
            .padding(.leading, 36)
            .frame(height: 42)
            .background(.white)
            .foregroundStyle(Color("Color/MediumGray"))
            .cornerRadius(26)
            .overlay(alignment: .leading){
                Image(systemName: "magnifyingglass")
                    .padding(.leading,12)
                    .foregroundColor(Color("Color/Primary"))
            }
        
    }

}

#Preview {
    ContentView()
}
