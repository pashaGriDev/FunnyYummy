//
//  RecentRecipeView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 29.08.2023.
//

import SwiftUI

struct RecentRecipeItem: View {
    
    @Binding var recipe: Recipe
    
    var body: some View {
        NavigationLink(destination: RecipeScreenView(recipe: recipe)) {
            VStack(alignment: .leading, spacing: 10) {
                ImageLoaderView(url: recipe.image)
                    .frame(width: 124, height: 124)
                    .clipped()
                    .background(.ultraThinMaterial)
                    .cornerRadius(16)
                
                VStack(alignment: .leading) {
                    Text(recipe.title)
                        .font(.headline.bold())
                        .multilineTextAlignment(.leading)
                    Text(recipe.creatorName)
                        .font(.system(size: 12))
                        .foregroundColor(.gray.opacity(0.8))
                }
                .frame(width: 124)
                .background(recipe.title.isEmpty ? .gray.opacity(0.1) : .clear)
                .cornerRadius(10)
            }
            .frame(width: 124, height: 210)
        }
    }
}

struct RecentRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecentRecipeItem(recipe: .constant(Bundle.main.decode(Recipe.self, from: "mockData.json")))
        }
    }
}
