//
//  PokemonDO.swift
//  PokemonApp
//
//  Created by Victor Marquez on 23/11/24.
//

import Foundation

// MARK: - PokemonResponseDataModel
struct PokemonsResponseDO: Codable {
    let count: Int
    let next: String
    let previous: JSONNull?
    let results: [PokemonDO]
}

// MARK: - PokemonDataModel
struct PokemonDO: Codable {
    let name: String
    let url: String
}
