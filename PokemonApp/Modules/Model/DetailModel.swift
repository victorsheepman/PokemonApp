//
//  DetailModel.swift
//  PokemonApp
//
//  Created by Victor Marquez on 18/5/24.
//

import Foundation
import SwiftUI

struct DetailModel{
    let name:String
    let tag: Int
    let stats:[Stat]
    let mainType:String
    let image: String
    let types: [TypeElement]
    let weight: Int
    let height: Int
    
    init(
          name: String = "",
          tag: Int = 0,
          stats: [Stat] = [],
          mainType: String = "",
          image: String = "",
          types: [TypeElement] = [],
          weight: Int = 0,
          height: Int = 0
      ) {
          self.name = name
          self.tag = tag
          self.stats = stats
          self.mainType = mainType
          self.image = image
          self.types = types
          self.weight = weight
          self.height = height
      }
    
    var color: Color {
        Color("Color/\(mainType)")
    }
}
