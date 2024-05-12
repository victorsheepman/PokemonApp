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
    private var cancellables = Set<AnyCancellable>()
    private let apiClient = ApiClient()
    
    @Published var posts: [DataModel] = []
    
    func fetchPosts(){
        apiClient.fetchPost()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {_ in}){posts in
                self.posts = posts
            }
            .store(in: &cancellables)
    }
    
    
}
