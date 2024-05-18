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
    private let detailModelMapper:DetailModelMapper = DetailModelMapper()
    @Published var pokemonDetail: DetailModel = DetailModel.init()
    
    
    func fetchPokemonDetail(pokemonUrl:String){
        pokemonDetailApi.fetchData(url: pokemonUrl)
            .map{self.detailModelMapper.mapDataModelToModel(dataModel:$0)}
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {_ in}){ data in
                self.pokemonDetail = data
            }
            .store(in: &cancellables)
    }
}
