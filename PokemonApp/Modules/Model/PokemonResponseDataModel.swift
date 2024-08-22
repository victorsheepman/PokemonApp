//
//  PokemonResponseDataModel.swift
//  PokemonApp
//
//  Created by Victor Marquez on 12/5/24.
//

import Foundation

// MARK: - PokemonResponseDataModel
struct PokemonResponseDataModel: Codable {
    let count: Int
    let next: String
    let previous: JSONNull?
    let results: [PokemonDataModel]
}

// MARK: - PokemonDataModel
struct PokemonDataModel: Codable {
    let name: String
    let url: String
}

// MARK: - Encode/decode helpers


