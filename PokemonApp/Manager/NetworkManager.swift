//
//  NetworkManager.swift
//  PokemonApp
//
//  Created by Victor Marquez on 22/8/24.
//

import Foundation
import Combine

enum NetworkError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingError(Error)
}

class NetworkManager {
    static let shared = NetworkManager()
    func fetchData<T: Decodable>(from url: URL, responseType: T.Type) -> Future<T, NetworkError> {
        return Future<T, NetworkError> { promise in
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error  {
                    promise(.failure(.requestFailed(error)))
                    return
                }
                guard let data = data else {
                    promise(.failure(.invalidResponse))
                    return
                }
                
                do {
                    let decodedData = try JSONDecoder().decode(responseType, from: data)
                    promise(.success(decodedData))
                } catch {
                    promise(.failure(.decodingError(error)))
                }
            }.resume()
        }
    }
}
