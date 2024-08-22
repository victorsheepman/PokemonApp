//
//  HomeViewModel.swift
//  PokemonApp
//
//  Created by Victor Marquez on 12/5/24.
//

import Foundation
import Combine


class HomeViewModel: ObservableObject {
    
    @Published var pokemons: [PokemonDataModel] = []
    
    private var cancellables = Set<AnyCancellable>()
    private let baseURL = Constansts.MainURL.main + Constansts.Endpoints.pokemonList
    
    func fetchData(){
        guard let url = URL(string: baseURL) else {
            self.handleError(.invalidURL)
            return
        }
        NetworkManager.shared.fetchData(from: url, responseType: PokemonResponseDataModel.self)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.handleError(error)
                }
            } receiveValue: { [weak self] dataModel in
                print("pokemones: \(dataModel.results)")
                self?.pokemons = dataModel.results
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
