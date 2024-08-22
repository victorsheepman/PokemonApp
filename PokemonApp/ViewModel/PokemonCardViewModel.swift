//
//  PokemonCardViewModel.swift
//  PokemonApp
//
//  Created by Victor Marquez on 15/5/24.
//

import Foundation
import Combine

class PokemonCardViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()

    @Published var pokemonSprite:String = ""
    @Published var pokemonTag: Int  = 0
    
    func fetchPokemonDetail(pokemonUrl: String) {
        guard let url = URL(string: pokemonUrl) else {
            self.handleError(.invalidURL)
            return
        }
        
        NetworkManager.shared.fetchData(from: url, responseType: PokemomSelectedModel.self)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.handleError(error)
                }
            } receiveValue: { [weak self] dataModel in
                self?.pokemonSprite = dataModel.sprites.front_default ?? ""
                self?.pokemonTag = dataModel.order
            }
            .store(in: &cancellables)
    }
    
    
    private func handleError(_ error: NetworkError) {
        switch error {
        case .invalidURL:
            print("Error: La URL es inválida.")
        case .requestFailed(let underlyingError):
            print("Error: La solicitud falló con error: \(underlyingError.localizedDescription)")
        case .invalidResponse:
            print("Error: La respuesta del servidor no es válida.")
        case .decodingError(let decodingError):
            print("Error: Falló la decodificación de los datos con error: \(decodingError.localizedDescription)")
        }
    }
    
    
}
