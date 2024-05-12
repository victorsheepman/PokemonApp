//
//  ApiClient.swift
//  PokemonApp
//
//  Created by Victor Marquez on 12/5/24.
//

import Foundation
import Combine


class ApiClient {
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    
    func fetchPost() -> AnyPublisher<[DataModel], Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap() { element -> Data in
                   guard let httpResponse = element.response as? HTTPURLResponse,
                       httpResponse.statusCode == 200 else {
                           throw URLError(.badServerResponse)
                       }
                   return element.data
            }
            .decode(type: [DataModel].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

