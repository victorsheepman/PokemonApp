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
                            VStack(spacing:20){
                                HStack{
                                    Rectangle()
                                        .frame(width: 46, height: 20)
                                        .cornerRadius(10)
                                        .foregroundStyle(Color("Color/Grass"))
                                        .overlay {
                                            Text("Grass")
                                                .font(.system(size: 10))
                                                .fontWeight(.bold)
                                                .foregroundStyle(.white)
                                        }
                                    Rectangle()
                                        .frame(width: 46, height: 20)
                                        .cornerRadius(10)
                                        .foregroundStyle(Color("Color/Poison"))
                                        .overlay {
                                            Text("Poison")
                                                .font(.system(size: 10))
                                                .fontWeight(.bold)
                                                .foregroundStyle(.white)
                                        }
                                }
                                Text("About")
                                    .font(.system(size: 16))
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color("Color/Grass"))
                                HStack(spacing:20){
                                    Spacer()
                                    VStack(spacing:15){
                                        HStack {
                                            Image("weight")
                                                .renderingMode(.template)
                                                .resizable()
                                                .frame(width:16, height: 16)
                                            Text("6,9 kg")
                                        }
                                        Text("Weight")
                                            .font(.system(size: 12))
                                            .foregroundStyle(Color("Color/MediumGray"))
                                       
                                    }
                                    Divider()
                                    VStack(spacing:15){
                                        HStack {
                                            Image("straighten")
                                                .renderingMode(.template)
                                                .resizable()
                                                .frame(width:16, height: 16)
                                                .rotationEffect(.degrees(90))
                                            Text("0,9 m")
                                        }
                                        Text("Height")
                                            .font(.system(size: 12))
                                            .foregroundStyle(Color("Color/MediumGray"))
                                       
                                    }

                                    Spacer()
                                }.frame(height: 28)
                                
                                Text("There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.")
                                    .font(.system(size: 12))
                                    .padding(.top, 18)
                                
                                Text("Base Stats")
                                    .font(.system(size: 16))
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color("Color/Grass"))
                                
                                //STATS
                                VStack{
                                    HStack{
                                        VStack(alignment: .trailing, spacing: 5){
                                            Text("HP")
                                                .font(.system(size: 14))
                                                .fontWeight(.bold)
                                                .foregroundStyle(Color("Color/Grass"))
                                            Text("ATK")
                                                .font(.system(size: 14))
                                                .fontWeight(.bold)
                                                .foregroundStyle(Color("Color/Grass"))
                                            Text("DEF")
                                                .font(.system(size: 14))
                                                .fontWeight(.bold)
                                                .foregroundStyle(Color("Color/Grass"))
                                            Text("SATK")
                                                .font(.system(size: 14))
                                                .fontWeight(.bold)
                                                .foregroundStyle(Color("Color/Grass"))
                                            Text("SDEF")
                                                .font(.system(size: 14))
                                                .fontWeight(.bold)
                                                .foregroundStyle(Color("Color/Grass"))
                                            Text("SPD")
                                                .font(.system(size: 14))
                                                .fontWeight(.bold)
                                                .foregroundStyle(Color("Color/Grass"))
                                        }

                                        VStack(alignment: .trailing, spacing: 5){
                                            Text("045")
                                                .font(.system(size: 14))
                                                .fontWeight(.regular)
                                            Text("045")
                                                .font(.system(size: 14))
                                                .fontWeight(.regular)
                                            Text("045")
                                                .font(.system(size: 14))
                                                .fontWeight(.regular)
                                            Text("045")
                                                .font(.system(size: 14))
                                                .fontWeight(.regular)
                                            Text("045")
                                                .font(.system(size: 14))
                                                .fontWeight(.regular)
                                            Text("045")
                                                .font(.system(size: 14))
                                                .fontWeight(.regular)
                                        }
                                        VStack(alignment: .trailing, spacing: 18){
                                            ProgressView(value: 45.0, total: 100.0)
                                                .frame(width: 233)
                                                .accentColor(Color("Color/Grass"))
                                            ProgressView(value: 45.0, total: 100.0)
                                                .frame(width: 233)
                                                .accentColor(Color("Color/Grass"))
                                            ProgressView(value: 45.0, total: 100.0)
                                                .frame(width: 233)
                                                .accentColor(Color("Color/Grass"))
                                            ProgressView(value: 45.0, total: 100.0)
                                                .frame(width: 233)
                                                .accentColor(Color("Color/Grass"))
                                            ProgressView(value: 45.0, total: 100.0)
                                                .frame(width: 233)
                                                .accentColor(Color("Color/Grass"))
                                            ProgressView(value: 45.0, total: 100.0)
                                                .frame(width: 233)
                                                .accentColor(Color("Color/Grass"))
                                        }
                                  
                                    }
    
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


