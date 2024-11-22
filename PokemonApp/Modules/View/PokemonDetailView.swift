//
//  PokemonDetailView.swift
//  PokemonApp
//
//  Created by Victor Marquez on 16/5/24.
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

enum BudgetCategory: String, CaseIterable, Identifiable, Codable {
    
    case entertainment = "Entertainment"
    case bills = "Bills"
    case diningOut = "Dining Out"
    case personalCare = "Personal Care"
    case groceries = "groceries"
    case transportation = "Transportation"
    case education = "Education"
    
    var id: String { rawValue }
}

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
                                
                                HStack{
                                    ForEach(viewModel.pokemonDetail.types, id: \.slot) { type in
                                        typeCard(type.type)
                                    }
                                }
                                
                                Text("About")
                                    .font(.system(size: 16))
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color("Color/\(viewModel.pokemonDetail.mainType)"))
                                
                                
                                HStack(alignment: .center, spacing:20) {
                                    sizeList
                                }.frame(height: 28)
                                
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
    
    var sizeList: some View {
        ForEach(viewModel.sizes.indices, id: \.self) { index in
            let (size, value) = viewModel.sizes[index]
            sizeInfo(size, value)
            if index != viewModel.sizes.count - 1 {
                Divider()
            }
        }
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

#Preview {
    PokemonDetailView(url: "https://pokeapi.co/api/v2/pokemon/2/")
}
