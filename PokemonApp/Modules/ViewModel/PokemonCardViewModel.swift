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

    @Published var pokemonSprite:String = ""
    @Published var pokemonTag: Int  = 0
    
    var onFirst: Bool {
        pokemonSprite.isEmpty
    }
    
    func fetchPokemonDetail(pokemonUrl: String) {
        guard let url = URL(string: pokemonUrl) else {
            ErrorManager.shared.handler(.invalidURL)
            return
        }
        print("Se ejecuto")
        NetworkManager.shared.fetchData(from: url, responseType: PokemomSelectedModel.self)
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
