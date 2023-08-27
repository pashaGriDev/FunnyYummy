//
//  MainScreenView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 27.08.2023.
//

import SwiftUI

struct MainScreenView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Get amazing recipes for cooking")
                    .font(.largeTitle.bold())
                ScrollView(.vertical, showsIndicators: false) {
                    Group {
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
                                            .background(Color.green.cornerRadius(24))
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
                                                    Image(systemName: "bookmark.fill")
                                                        .foregroundColor(.white)
                                                        .padding(.all, 6)
                                                        .background(
                                                            Circle()
                                                                .fill(.gray)
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
                                            .fill(.green)
                                            .frame(width: 150, height: 176)
                                            .cornerRadius(16)
                                        Circle()
                                            .fill(.red)
                                            .frame(width: 110)
                                            .offset(y: -80)
                                    }
                                    .frame(height: 270)
                                }
                            }
                        }
                    }
                }
            }
            .padding([.horizontal, .top])
        }
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
