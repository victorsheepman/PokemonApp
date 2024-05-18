//
//  Extensions.swift
//  PokemonApp
//
//  Created by Victor Marquez on 18/5/24.
//

import Foundation
extension String {
    var capitalizedFirst: String {
        guard !self.isEmpty else { return self }
        return self.prefix(1).capitalized + self.dropFirst()
    }
}
