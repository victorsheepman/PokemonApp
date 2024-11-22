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
    private let detailModelMapper:DetailModelMapper = DetailModelMapper()
    
    @Published var pokemonDetail: DetailModel = DetailModel.init()
    


    let stastNames = ["HP","ATK","DEF","SATK","SDEF","SPD"]
    
    
    
    func fetchPokemonDetail(pokemonUrl:String){
        guard let url = URL(string: pokemonUrl) else {
            ErrorManager.shared.handler(.invalidURL)
            return
        }
        
        NetworkManager.shared.fetchData(from: url, responseType: PokemonDetailResponseDataModel.self)
            .map{self.detailModelMapper.mapDataModelToModel(dataModel:$0)}
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    ErrorManager.shared.handler(error)
                }
            } receiveValue: { [weak self] dataModel in
                self?.pokemonDetail = dataModel
            }
            .store(in: &cancellables)
    }
}
