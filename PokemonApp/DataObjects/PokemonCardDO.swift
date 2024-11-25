//
//  PokemonCardDO.swift
//  PokemonApp
//
//  Created by Victor Marquez on 23/11/24.
//

import Foundation

struct PokemomCardDO: Codable {
    var sprites: PokemonSprites
    var weight: Int
    var order:  Int
}

struct PokemonSprites: Codable {
    var front_default: String?
}

