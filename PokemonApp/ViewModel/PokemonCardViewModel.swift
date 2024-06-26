//
//  PokemonCardViewModel.swift
//  PokemonApp
//
//  Created by Victor Marquez on 15/5/24.
//

import Foundation
import Combine

class PokemonCardViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    private let pokemonSeletectedApi = PokemonSelectedApi()
    @Published var pokemonSprite:String = ""
    @Published var pokemonTag: Int  = 0
    
    func fetchPokemonDetail(pokemonUrl:String){
        pokemonSeletectedApi.fetchData(url: pokemonUrl)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {_ in}){ data in
                self.pokemonSprite = data.sprites.front_default ?? ""
                print(data.order)
                self.pokemonTag = data.order
            }
            .store(in: &cancellables)
    }
    
    
}
