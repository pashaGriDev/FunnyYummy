//
//  RecentRecipeView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 29.08.2023.
//

import SwiftUI

struct RecentRecipeItem: View {
    
    @Binding var recipe: Recipe
    
    var titleRecipe: String {
        recipe.title ?? "" 
    }
    
    var body: some View {
        NavigationLink(destination: RecipeScreenView(recipe: recipe)) {
            VStack(alignment: .leading, spacing: 10) {
                ImageLoaderView(url: recipe.image ?? "")
                    .frame(width: 124, height: 124)
                    .clipped()
                    .background(.ultraThinMaterial)
                    .cornerRadius(16)
                
                VStack(alignment: .leading) {
                    Text(titleRecipe)
                        .font(.headline.bold())
                        .multilineTextAlignment(.leading)
                    Text(recipe.creditsText ?? "no creator")
                        .font(.system(size: 12))
                        .foregroundColor(.gray.opacity(0.8))
                }
                .frame(width: 124, height: 60, alignment: .bottom)
                .background(titleRecipe.isEmpty ? .gray.opacity(0.1) : .clear)
                .cornerRadius(10)
            }
            .frame(width: 124, height: 210)
        }
    }
}

struct RecentRecipeView_Previews: PreviewProvider {
    static let mockData = Recipe(creditsText: "blogspot.com", id: 782585, aggregateLikes: 1000, title: "Cannellini Bean and Asparagus Salad with Mushrooms", sourceUrl: "http://foodandspice.blogspot.com/2016/05/cannellini-bean-and-asparagus-salad.html", image: "https://spoonacular.com/recipeImages/782585-312x231.jpg", imageType: "", readyInMinutes: 0, dishTypes: [], extendedIngredients: [], analyzedInstructions: [])
    static var previews: some View {
        NavigationView {
            RecentRecipeItem(recipe: .constant(mockData))
        }
    }
}
