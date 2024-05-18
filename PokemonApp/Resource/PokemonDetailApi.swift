//
//  PokemonDetailApi.swift
//  PokemonApp
//
//  Created by Victor Marquez on 18/5/24.
//

import Foundation
import Combine

class PokemonDetailApi {
    func fetchData(url: String) -> AnyPublisher<PokemonDetailResponseDataModel, Error> {
        guard let url = URL(string: url) else {
            // Retorna un error si la URL no es válida
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: PokemonDetailResponseDataModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
