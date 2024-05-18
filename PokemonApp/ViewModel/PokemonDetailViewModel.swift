//
//  PokemonDetailViewModel.swift
//  PokemonApp
//
//  Created by Victor Marquez on 18/5/24.
//

import Foundation
import Combine

class PokemonDetailViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    private let pokemonDetailApi = PokemonDetailApi()
    @Published var pokemonDetail: PokemonDetailResponseDataModel = PokemonDetailResponseDataModel.init()
    
    
    func fetchPokemonDetail(pokemonUrl:String){
        pokemonDetailApi.fetchData(url: pokemonUrl)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {_ in}){ data in
                self.pokemonDetail = data
            }
            .store(in: &cancellables)
    }
}
