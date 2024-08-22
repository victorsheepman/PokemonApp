//
//  ErrorManager.swift
//  PokemonApp
//
//  Created by Victor Marquez on 22/8/24.
//

import Foundation

class ErrorManager {
    static let shared = ErrorManager()

    func handler(_ error: NetworkError) {
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
