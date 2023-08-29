//
//  PopularCategoryItem.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 29.08.2023.
//

import SwiftUI

struct PopularCategoryItem: View {
    var body: some View {
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
                        
                        AsyncImage(url: URL(string: "https://spoonacular.com/recipeImages/716429-312x231.jpg")) { phase in
                            switch phase {
                            case let .success(image):
                                image
                                    .resizable()
                                    .scaledToFill()
                            case .empty:
                                ProgressView()
                                    .scaleEffect(2)
                            default:
                                Image(systemName: "questionmark")
                                    .font(.headline)
                            }
                        }
                        .frame(width: 110, height: 110)
                        .background(.ultraThinMaterial)
                        .clipShape(Circle())
                        .offset(y: -90)
                        .shadow(radius: 5)
                    }
                    .frame(height: 240, alignment: .bottom)
                }
            }
        }
    }
}

struct PopularCategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        PopularCategoryItem()
    }
}
