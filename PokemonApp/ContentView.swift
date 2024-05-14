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
    
    var pokemons: [PokemonDataModel] {
        
        guard !searchText.isEmpty else { return viewModel.pokemons }
        
        return viewModel.pokemons.filter {
            $0.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("Color/Primary").edgesIgnoringSafeArea(.all)
                VStack{
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
                    HStack {
                        TextField("search", text: $searchText)
                            .padding(.leading, 36)
                            .frame(width:280, height: 42)
                            .background(.white)
                            .foregroundStyle(Color("Color/MediumGray"))
                            .cornerRadius(26)
                            .overlay(alignment: .leading){
                                Image("search")
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                    .padding(.leading,12)
                                    .foregroundColor(.red)
                            }
                        Spacer()
                    }
                    //LISTA DE EJEMPLOS - PRONTA ELIMINACION
                    List {
                        ForEach(pokemons, id:\.name){ pokemon in
                            Text(pokemon.name)
                        }
                    }
                    Spacer()
                }.padding(.horizontal, 18)
            }.onAppear{
                viewModel.fetchData()
            }
        }
    }
}

#Preview {
    ContentView()
}
