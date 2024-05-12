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
            .map(\.data)
            .decode(type: [DataModel].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

