//
//  HomeViewModel.swift
//  PokemonApp
//
//  Created by Victor Marquez on 12/5/24.
//

import Foundation
import Combine




class HomeViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    private let apiClient = ApiClient()
    private let pokemonSeletectedApi = PokemonSelectedApi()
    
    @Published var pokemons: [PokemonDataModel] = []
    
    func fetchData(){
        apiClient.fetchData()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {_ in}){ data in
                self.pokemons = data.results
            }
            .store(in: &cancellables)
    }
    
    func fetchPokemonDetail(pokemonUrl:String){
        pokemonSeletectedApi.fetchData(url: pokemonUrl)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {_ in}){ data in
                print(data)
            }
            .store(in: &cancellables)
    }
    
    
}
