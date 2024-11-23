//
//  PokemonListOO.swift
//  PokemonApp
//
//  Created by Victor Marquez on 23/11/24.
//

import Foundation
import Combine


class PokemonListOO: ObservableObject {
    
    @Published var pokemons: [PokemonDO] = []
    @Published var searchText: String = ""
    @Published var filteredPokemons: [PokemonDO] = []
    
    private var cancellables = Set<AnyCancellable>()
    private let baseURL = Constansts.MainURL.main + Constansts.Endpoints.pokemonList
    
    init() {
        setupBindings()
        fetchData()
    }
    
    // Reactivamente filtra los Pokémon en base al texto de búsqueda
    private func setupBindings() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .combineLatest($pokemons)
            .map { searchText, pokemons in
                guard !searchText.isEmpty else { return pokemons }
                return pokemons.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            }
            .assign(to: &$filteredPokemons)
    }
    
    private func fetchData(){
        guard let url = URL(string: baseURL) else {
            ErrorManager.shared.handler(.invalidURL)
            return
        }
        NetworkManager.shared.fetchData(from: url, responseType: PokemonsResponseDO.self)
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
