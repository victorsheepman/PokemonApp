//
//  PokemonCardView.swift
//  PokemonApp
//
//  Created by Victor Marquez on 15/5/24.
//

import SwiftUI
import Combine

struct PokemonCardView: View {
    var pokemon: PokemonDataModel
    @StateObject var viewModel = PokemonCardViewModel()
    
    var body: some View {
        Rectangle()
            .frame(width: 110, height: 108)
            .cornerRadius(8)
            .foregroundColor(.white)
            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
            .overlay(
                ZStack {
                    Rectangle()
                        .frame(width: 110, height: 44)
                        .clipShape(
                            .rect(
                                topLeadingRadius: 7,
                                bottomLeadingRadius: 8,
                                bottomTrailingRadius: 8,
                                topTrailingRadius: 7
                            )
                        )
                        .padding(.top, 64)
                        .foregroundColor(Color("Color/BackgroundGray"))
                    
                    content
                }.onAppear {
                    if viewModel.onFirst {
                        viewModel.fetchPokemonDetail(pokemonUrl: pokemon.url)
                    }
                }
            )
    }
    
    var content: some View {
        VStack(spacing:0) {
            
            Text("#\(viewModel.pokemonTag)")
                .font(.system(size: 10))
                .foregroundStyle(Color("Color/MediumGray"))
                .fontWeight(.light)
                .padding(.leading,55)
            
            AsyncImage(url:URL(string: viewModel.pokemonSprite)){ phase in
                phase
                    .resizable()
            } placeholder: {
                Image("Silhouette")
                    .resizable()
            }.frame(width: 72, height: 72)
            
            Text(pokemon.name)
                .font(.system(size: 12))
                .fontWeight(.medium)
                .foregroundStyle(Color("Color/DarkGray"))
        }
    }
}

#Preview {
    PokemonCardView(pokemon: PokemonDataModel(name: "carlos", url: "https://placebear.com/1000/1000"))
}
