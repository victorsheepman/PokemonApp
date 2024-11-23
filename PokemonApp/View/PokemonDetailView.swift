//
//  PokemonDetailView.swift
//  PokemonApp
//
//  Created by Victor Marquez on 16/5/24.
//

import SwiftUI



struct PokemonDetailView: View {
    var url:String
    
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel = PokemonDetailViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color("Color/\(viewModel.pokemonDetail.mainType)").edgesIgnoringSafeArea(.all)
                Image("Pokeball")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 208, height: 208)
                    .padding(.top, -400)
                    .padding(.leading, 170)
                    .foregroundStyle(.white.opacity(0.2))
                VStack{
                    
                    AsyncImage(url:URL(string: viewModel.pokemonDetail.image)){ phase in
                        phase
                          .resizable()
                    }placeholder: {
                        Image("Silhouette")
                            .resizable()
                    }.frame(width: 200, height: 200)
                    
                    PokemonInfoView(
                        pokemon: viewModel.pokemonDetail,
                        sizes: viewModel.sizes
                    )
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .tint(.white)
                    }
                    Text(viewModel.pokemonDetail.name.capitalizedFirst)
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Text("#\(viewModel.pokemonDetail.tag)")
                    .font(.callout.bold())
                    .foregroundStyle(.white)
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear{
            viewModel.fetchPokemonDetail(pokemonUrl:url )
        }

    }
}

#Preview {
    PokemonDetailView(url: "https://pokeapi.co/api/v2/pokemon/2/")
}
