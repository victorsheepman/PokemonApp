//
//  PokemonCardOO.swift
//  PokemonApp
//
//  Created by Victor Marquez on 23/11/24.
//

import Foundation
import Combine

class PokemonCardOO: ObservableObject {
   
    private var cancellables = Set<AnyCancellable>()

    @Published var pokemonSprite:String = ""
    @Published var pokemonTag: Int  = 0
    
    var isDataLoaded: Bool {
          !pokemonSprite.isEmpty
    }
    
    func fetchPokemonDetail(pokemonUrl: String) {
        guard let url = URL(string: pokemonUrl) else {
            ErrorManager.shared.handler(.invalidURL)
            return
        }
       
        NetworkManager.shared.fetchData(from: url, responseType: PokemomCardDO.self)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    ErrorManager.shared.handler(error)
                }
            } receiveValue: { [weak self] dataModel in
                self?.pokemonSprite = dataModel.sprites.front_default ?? ""
                self?.pokemonTag = dataModel.order
            }
            .store(in: &cancellables)
    }
}
