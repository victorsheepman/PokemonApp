//
//  PokemonInfoView.swift
//  PokemonApp
//
//  Created by Victor Marquez on 22/11/24.
//

import SwiftUI

enum PokemonSize: String {
    case weight = "Weight"
    case height = "Height"
    
    var icon: Image {
        switch self {
        case .weight:
            return Image(systemName: "scalemass")
        case .height:
            return Image(systemName: "pencil.and.ruler")
        }
    }
    
    var symbol: String {
        switch self {
        case .weight:
            return "kg"
        case .height:
            return "m"
        }
    }
}


struct PokemonInfoView: View {
    
    var pokemon: DetailModel
    var sizes: [(PokemonSize, Int)]
    
    private let statNames = ["HP","ATK","DEF","SATK","SDEF","SPD"]
    
    var body: some View {
        Rectangle()
            .frame(width: 352, height: 452)
            .cornerRadius(8)
            .foregroundColor(.white)
            .overlay {
                VStack(spacing:20) {
                    
                    HStack{
                        ForEach(pokemon.types, id: \.slot) { type in
                            typeCard(type.type)
                        }
                    }
                    
                    about
                    
                    baseStats
                    
                    Spacer()
                    
                }.padding(.top,56)
            }
    }
    // MARK: - About Section
    var about: some View {
        VStack(spacing: 16) {
            Text("About")
                .font(.callout.bold())
                .foregroundStyle(pokemon.color)
            
            HStack(alignment: .center, spacing:20) {
                
                ForEach(sizes.indices, id: \.self) { index in
                    let (size, value) = sizes[index]
                    sizeInfo(size, value)
                    if index != sizes.count - 1 {
                        Divider()
                    }
                }
                
            }
            .frame(height: 28)
            
            Text("There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.")
                .font(.caption)
                .padding()
        }
    }
    
    // MARK: - Base Stats Section
    var baseStats: some View {
        VStack {
            Text("Base Stats")
                .font(.callout.bold())
                .foregroundStyle(pokemon.color)
            
            HStack {
                VStack(alignment: .trailing, spacing: 5){
                    ForEach(pokemon.stats.indices, id: \.self) { index in
                        let stat = pokemon.stats[index]
                        chartStat(stat, name: statNames[index])
                    }
                }
            }
        }
    }

    // MARK: - Stat Progress Bar
    func chartStat(_ stat: Stat, name: String) -> some View {
        HStack {
            Group {
                Text("\(name)")
                    .fontWeight(.bold)
                    .foregroundStyle(pokemon.color)
                
                Text("\(stat.baseStat)")
            }.font(.subheadline)
            
            ProgressView(value: Double(stat.baseStat), total: 100.0)
                .frame(width: 233)
                .accentColor(pokemon.color)
        }
    }
    
    // MARK: - Type Card for Pokémon Type
    func typeCard(_ specie: Species) -> some View {
        Rectangle()
            .frame(width: 51, height: 20)
            .cornerRadius(10)
            .foregroundStyle(specie.color)
            .overlay {
                Text(specie.name.capitalizedFirst)
                    .font(.caption2.bold())
                    .foregroundStyle(.white)
            }
    }
    // MARK: - Size Information
    func sizeInfo(_ size: PokemonSize, _ value: Int) -> some View {
        VStack(spacing: 10){
            HStack {
                size.icon
                    .resizable()
                    .frame(width:16, height: 16)
                Text("\(value) \(size.symbol)")
                    .font(.caption)
            }
            Text(size.rawValue)
                .font(.caption)
                .foregroundStyle(Color("Color/MediumGray"))
        }
    }
}
