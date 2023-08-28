//
//  PopularCategoryView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 28.08.2023.
//

import SwiftUI

struct PopularCategoryView: View {
    let array = ["Salad", "Appetizer", "Breakfast", "Noodle", "Lunch", "Dinner"]
    var body: some View {
        // TODO: - Popular category
        VStack(alignment: .leading, spacing: 10) {
            HeaderTitleView(title: "Popular category", hasNavigationLink: false)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(array, id: \.self) {
                        Text($0)
                            .foregroundColor(.white)
                            .padding(.all, 10)
                            .background(Color.buttonColor.cornerRadius(10))
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
    }
}

struct PopularCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        PopularCategoryView()
    }
}
