//
//  PokemomSelectedModel.swift
//  PokemonApp
//
//  Created by Victor Marquez on 12/5/24.
//

import Foundation
struct PokemomSelectedModel: Codable {
    var sprites:PokemonSprites
    var weight: Int
}

struct PokemonSprites:Codable {
    var front_default: String?
}
