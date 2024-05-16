//
//  PokemonDetailView.swift
//  PokemonApp
//
//  Created by Victor Marquez on 16/5/24.
//

import SwiftUI

struct PokemonDetailView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color("Color/Grass").edgesIgnoringSafeArea(.all)
                Image("Pokeball")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 208, height: 208)
                    .padding(.top, -400)
                    .padding(.leading, 170)
                    .foregroundStyle(.white.opacity(0.2))
                VStack{
                    HStack(alignment:.center){
                        HStack(spacing:13){
                            Image("arrow_back")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 32, height: 32)
                                .foregroundStyle(.white)
                            
                            Text("Bulbasur")
                                .font(.system(size: 32))
                                .bold()
                                .foregroundStyle(.white)
                        }
                        Spacer()
                        Text("#001")
                            .font(.system(size: 16))
                            .bold()
                            .foregroundStyle(.white)
                       
                    }
                    .padding(.horizontal, 24)
                   
                    Image("Silhouette")
                    Rectangle()
                        .frame(width: 352, height: 502)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        .overlay {
                            VStack{
                                HStack{
                                    
                                }
                                Spacer()
                            }.padding(.top,56)
                        }

                }
                
               
            }
        }
    }
}

#Preview {
    PokemonDetailView()
}
