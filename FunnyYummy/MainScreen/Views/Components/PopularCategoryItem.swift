//
//  PopularCategoryItem.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 29.08.2023.
//

import SwiftUI

struct PopularCategoryItem: View {
    @Binding var recipe: Recipe
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.gray.opacity(0.3))
                .frame(width: 150, height: 176)
                .cornerRadius(16)
                .overlay(
                    VStack(spacing: 30) {
                        Text(recipe.title)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Time")
                                    .foregroundColor(.gray.opacity(0.8))
                                Text("\(recipe.readyInMinutes.formatted()) mins")
                            }
                            Spacer()
                            
                            BookmarkView()
                        }
                    }
                    .padding([.horizontal, .bottom], 6), alignment: .bottom
                )
            
            ImageLoaderView(url: recipe.image)
                .frame(width: 110, height: 110)
                .background(.ultraThinMaterial)
                .clipShape(Circle())
                .offset(y: -90)
                .shadow(radius: 5)
        }
        .frame(height: 240, alignment: .bottom)
    }
}

struct PopularCategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        PopularCategoryItem(recipe: .constant(Bundle.main.decode(Recipe.self, from: "mockData.json")))
    }
}
