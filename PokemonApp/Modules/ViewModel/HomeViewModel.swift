//
//  HomeViewModel.swift
//  PokemonApp
//
//  Created by Victor Marquez on 12/5/24.
//

import Foundation
import Combine


class HomeViewModel: ObservableObject {
    
    @Published var pokemons: [PokemonDataModel] = []
    
    private var cancellables = Set<AnyCancellable>()
    private let baseURL = Constansts.MainURL.main + Constansts.Endpoints.pokemonList
    
    func fetchData(){
        guard let url = URL(string: baseURL) else {
            ErrorManager.shared.handler(.invalidURL)
            return
        }
        NetworkManager.shared.fetchData(from: url, responseType: PokemonResponseDataModel.self)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    ErrorManager.shared.handler(error)
                }
            } receiveValue: { [weak self] dataModel in
                self?.pokemons = dataModel.results
            }
            .store(in: &cancellables)
    }
}
