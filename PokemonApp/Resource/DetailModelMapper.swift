//
//  DetailModelMapper.swift
//  PokemonApp
//
//  Created by Victor Marquez on 18/5/24.
//

import Foundation

struct DetailModelMapper {
    func mapDataModelToModel(dataModel: PokemonDetailResponseDataModel) -> DetailModel {
        
        return DetailModel(
            name:     dataModel.name,
            tag:      dataModel.order,
            stats:    dataModel.stats,
            mainType: dataModel.types.first?.type.name.capitalizedFirst ?? "Grass",
            image:    dataModel.sprites.frontDefault,
            types:    dataModel.types,
            weight:   dataModel.weight,
            height:   dataModel.height
        )
    }
}
