//
//  PokemonCardView.swift
//  PokemonApp
//
//  Created by Victor Marquez on 15/5/24.
//

import SwiftUI

struct PokemonCardView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 104, height: 108)
                .cornerRadius(8)
                .foregroundColor(.blue)
                .overlay(
                    Rectangle()
                        .frame(width: 104, height: 44) // Mitad del tamaño
                        .foregroundColor(.white)
                        .padding(.top, 64)
                )
        }
    }
}

#Preview {
    PokemonCardView()
}
