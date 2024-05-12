//
//  HomeViewModel.swift
//  PokemonApp
//
//  Created by Victor Marquez on 12/5/24.
//

import Foundation
import Combine

struct DataModel: Decodable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}


class HomeViewModel: ObservableObject {
    
    
    
}
