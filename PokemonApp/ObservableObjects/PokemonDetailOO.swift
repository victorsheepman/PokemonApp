//
//  PokemonDetailOO.swift
//  PokemonApp
//
//  Created by Victor Marquez on 23/11/24.
//

import Foundation
import Combine

class PokemonDetailOO: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
   
    @Published var pokemonDetail: DetailModel = DetailModel.init()
    
    var sizes: [(PokemonSize, Int)] {
          [
              (PokemonSize.weight, pokemonDetail.weight),
              (PokemonSize.height, pokemonDetail.height)
          ]
    }
    
    func fetchPokemonDetail(pokemonUrl:String){
        guard let url = URL(string: pokemonUrl) else {
            ErrorManager.shared.handler(.invalidURL)
            return
        }
        
        NetworkManager.shared.fetchData(from: url, responseType: PokemonDetailResponseDataModel.self)
            .receive(on: DispatchQueue.main)
            .map { self.mapToDetailModel(from: $0) }
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
    
      private func mapToDetailModel(from response: PokemonDetailResponseDataModel) -> DetailModel {
          return DetailModel(
              name:     response.name,
              tag:      response.order,
              stats:    response.stats,
              mainType: response.types.first?.type.name.capitalizedFirst ?? "Grass",
              image:    response.sprites.frontDefault,
              types:    response.types,
              weight:   response.weight,
              height:   response.height
          )
      }
}

