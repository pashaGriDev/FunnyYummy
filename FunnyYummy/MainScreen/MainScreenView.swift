//
//  MainScreenView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 27.08.2023.
//

import SwiftUI

struct MainScreenView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Get amazing recipes for cooking")
                .font(.largeTitle.bold())
            ScrollView(.vertical, showsIndicators: false) {
                
                // TODO: - Trending now
                VStack {
                    HStack {
                        Text("Trending now 🔥")
                            .font(.title.bold())
                        Spacer()
                        NavigationLink {
                            Text("See all")
                        } label: {
                            HStack {
                                Text("See all")
                                Image(systemName: "arrow.right")
                            }
                        }
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(1..<10) { _ in
                                VStack(alignment: .leading) {
                                    Image(systemName: "magnifyingglass")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 280, height: 180)
                                        .background(Color.gray.opacity(0.3).cornerRadius(24))
                                        .overlay(
                                            HStack {
                                                HStack(spacing: 0) {
                                                    Image(systemName: "star.fill")
                                                    Text("4.5")
                                                        .foregroundColor(.white)
                                                }
                                                .padding(.all, 2)
                                                .padding(.horizontal, 4)
                                                .background(Color.gray.cornerRadius(8))
                                                Spacer()
                                                Image(systemName: "bookmark")
                                                    .foregroundColor(.gray)
                                                    .padding(.all, 6)
                                                    .background(
                                                        Circle()
                                                            .fill(.white)
                                                    )
                                            }
                                                .padding()
                                            , alignment: .top
                                        )
                                    
                                    Text("How to shawarma at home")
                                    
                                    HStack {
                                        Image(systemName: "circle.fill")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                        Text("by Kasharin Mikhail")
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                        }
                    }
                }
                // TODO: - Popular category
                VStack(alignment: .leading, spacing: 10) {
                    let array = ["Salad", "Appetizer", "Breakfast", "Noodle", "Lunch", "Dinner"]
                    Text("Popular category")
                        .font(.title.bold())
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(array, id: \.self) {
                                Text($0)
                                    .foregroundColor(.white)
                                    .padding(.all, 10)
                                    .background(Color.red.cornerRadius(10))
                            }
                        }
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(1..<10) { _ in
                                ZStack {
                                    Rectangle()
                                        .fill(.gray.opacity(0.3))
                                        .frame(width: 150, height: 176)
                                        .cornerRadius(16)
                                        .overlay(
                                            VStack(spacing: 30) {
                                                Text("Chicken and Vegetable wrap")
                                                    .font(.headline)
                                                    .multilineTextAlignment(.center)
                                                
                                                HStack {
                                                    VStack(alignment: .leading) {
                                                        Text("Time")
                                                            .foregroundColor(.gray.opacity(0.8))
                                                        Text("5 mins")
                                                    }
                                                    Spacer()
                                                    
                                                    Image(systemName: "bookmark.fill")
                                                        .foregroundColor(.white)
                                                        .padding(.all, 6)
                                                        .background(
                                                            Circle()
                                                                .fill(.gray)
                                                        )
                                                }
                                            }.padding([.horizontal, .bottom], 6), alignment: .bottom
                                        )
                                    
                                    Image(systemName: "circle.fill")
                                        .resizable()
                                        .foregroundColor(.red)
                                        .frame(width: 110, height: 110)
                                        .offset(y: -90)
                                        .shadow(radius: 5)
                                }
                                .frame(height: 240, alignment: .bottom)
                            }
                        }
                    }
                }
                // TODO: - Recent recipe
                VStack {
                    HStack {
                        Text("Recente recipe")
                            .font(.title.bold())
                        Spacer()
                        NavigationLink {
                            Text("See all")
                        } label: {
                            HStack {
                                Text("See all")
                                Image(systemName: "arrow.right")
                            }
                        }
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(1..<10) { _ in
                                VStack(alignment: .leading) {
                                    Image(systemName: "magnifyingglass")
                                        .resizable()
                                        .scaledToFit()
                                        .background(Color.gray.opacity(0.3).cornerRadius(20))
                                    
                                    Text("Kelewele Ghanian Recipe")
                                        .font(.headline.bold())
                                    Text("by Mikhail Kasharin")
                                        .font(.system(size: 14))
                                        .foregroundColor(.gray.opacity(0.8))
                                }
                                .frame(width: 150)
                            }
                        }
                    }
                }
                // TODO: - Recent recipe
                VStack {
                    HStack {
                        Text("Popular creators")
                            .font(.title.bold())
                        Spacer()
                        NavigationLink {
                            Text("See all")
                        } label: {
                            HStack {
                                Text("See all")
                                Image(systemName: "arrow.right")
                            }
                        }
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(1..<10) { _ in
                                VStack {
                                    Image(systemName: "magnifyingglass")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 90, height: 90)
                                        .padding()
                                        .background(.gray.opacity(0.3))
                                        .clipShape(Circle())
                                    
                                    Text("Kasharin Mikhail")
                                        .font(.headline)
                                }
                            }
                        }
                    }
                }
                
            }
        }
        .padding([.horizontal, .top])
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainScreenView()
        }
    }
}
