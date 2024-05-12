//
//  ApiClient.swift
//  PokemonApp
//
//  Created by Victor Marquez on 12/5/24.
//

import Foundation
import Combine


class ApiClient {
    let url = URL(string: Constansts.MainURL.main+Constansts.Endpoints.pokemonList)!
    
    func fetchData() -> AnyPublisher<PokemonResponseDataModel, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap() { element -> Data in
                   guard let httpResponse = element.response as? HTTPURLResponse,
                       httpResponse.statusCode == 200 else {
                           throw URLError(.badServerResponse)
                       }
                   return element.data
            }
            .decode(type: PokemonResponseDataModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

