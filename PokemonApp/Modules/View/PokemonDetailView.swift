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


    private let stastNames = ["HP","ATK","DEF","SATK","SDEF","SPD"]
    
    
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
                   
                    Rectangle()
                        .frame(width: 352, height: 452)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        .overlay {
                            VStack(spacing:20) {
                                
                                types
                                
                                Text("About")
                                    .font(.system(size: 16))
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color("Color/\(viewModel.pokemonDetail.mainType)"))
                                
                                
                                about
                                
                                Text("There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.")
                                    .font(.system(size: 12))
                                    .padding(.top, 18)
                                
                                Text("Base Stats")
                                    .font(.system(size: 16))
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color("Color/\(viewModel.pokemonDetail.mainType)"))
                                
                                statsCharts
                                
                                Spacer()
                                
                            }.padding(.top,56)
                        }
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
   
    
    var types: some View {
        HStack{
            ForEach(viewModel.pokemonDetail.types, id: \.slot) { type in
                Rectangle()
                    .frame(width: 46, height: 20)
                    .cornerRadius(10)
                    .foregroundStyle(Color("Color/\(type.type.name.capitalizedFirst)"))
                    .overlay {
                        Text("\(type.type.name.capitalizedFirst)")
                            .font(.system(size: 10))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
            }
        }
    }
    
    var about: some View {
        HStack(spacing:20){
            Spacer()
            VStack(spacing:15){
                HStack {
                    Image("weight")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width:16, height: 16)
                    Text("\(viewModel.pokemonDetail.weight) kg")
                }
                Text("Weight")
                    .font(.system(size: 12))
                    .foregroundStyle(Color("Color/MediumGray"))
               
            }
            Divider()
            VStack(spacing:15){
                HStack {
                    Image("straighten")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width:16, height: 16)
                        .rotationEffect(.degrees(90))
                    Text("\(viewModel.pokemonDetail.height) m")
                }
                Text("Height")
                    .font(.system(size: 12))
                    .foregroundStyle(Color("Color/MediumGray"))
               
            }

            Spacer()
        }.frame(height: 28)
    }
    
    var statsCharts: some View {
        VStack{
            HStack{
                VStack(alignment: .trailing, spacing: 5){
                    ForEach(stastNames, id: \.self) { name in
                        Text("\(name)")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                            .foregroundStyle(Color("Color/\(viewModel.pokemonDetail.mainType)"))
                    }
                }

                VStack(alignment: .trailing, spacing: 5){
                    ForEach(viewModel.pokemonDetail.stats, id: \.stat.name) { stat in
                        Text("\(stat.baseStat)")
                            .font(.system(size: 14))
                            .fontWeight(.regular)
                    }
                }
                
                VStack(alignment: .trailing, spacing: 18){
                    ForEach(viewModel.pokemonDetail.stats, id: \.stat.name) { stat in
                        ProgressView(value: Double(stat.baseStat), total: 100.0)
                            .frame(width: 233)
                            .accentColor(Color("Color/\(viewModel.pokemonDetail.mainType)"))
                    }
                }
          
            }

        }
    }
    
   
}

#Preview {
    PokemonDetailView(url: "https://pokeapi.co/api/v2/pokemon/2/")
}
