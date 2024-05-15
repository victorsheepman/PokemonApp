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
            Color(.red).edgesIgnoringSafeArea(.all)
            Rectangle()
                .frame(width: 110, height: 108)
                .cornerRadius(8)
                .foregroundColor(.white)
                .overlay(
                    ZStack {
                        Rectangle()
                            .frame(width: 110, height: 44)
                            .clipShape(
                                .rect(
                                topLeadingRadius: 7,
                                bottomLeadingRadius: 8,
                                bottomTrailingRadius: 8,
                                topTrailingRadius: 7
                                )
                            )
                            .padding(.top, 64)
                        .foregroundColor(Color("Color/BackgroundGray"))
                        
                        VStack(spacing:0){
                            Text("#9999")
                                .font(.system(size: 10))
                                .foregroundStyle(Color("Color/MediumGray"))
                                .fontWeight(.light)
                                .padding(.leading,55)
                            Image("Silhouette")
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 72, height: 72)
                                .foregroundStyle(Color("Color/MediumGray"))
                            Text("Pokemon Name")
                                .font(.system(size: 12))
                                .fontWeight(.medium)
                                .foregroundStyle(Color("Color/DarkGray"))
                        }
                    }
                )
           
                
        }
    }
}

#Preview {
    PokemonCardView()
}
