//
//  CategoryViewCell.swift
//  FunnyYummy
//
//  Created by dsm 5e on 29.08.2023.
//

import SwiftUI

struct CategoryViewCell: View {
    let recipe: Recipe
    
    var titleRecipe: String {
        recipe.title ?? ""
    }
    
    var body: some View {
        NavigationLink(destination: RecipeScreenView(recipe: recipe)) {
            VStack {
                ImageLoaderView(url: recipe.image ?? "")
                    .frame(width: 350, height: 200)
                    .background(Color.gray.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .overlay(
                        VStack(alignment: .leading, spacing: 10) {
                            if !titleRecipe.isEmpty {
                                HStack(spacing: 0) {
                                    Image(systemName: "star.fill")
                                    Text(recipe.rating.formatted())
                                        .foregroundColor(.white)
                                }
                                .padding(.all, 2)
                                .padding(.horizontal, 4)
                                .background(Color.black.opacity(0.3).cornerRadius(8))
                            }
                                
                            Spacer()
                            
                            Text(titleRecipe)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                            
                            Text(recipe.creditsText ?? "no creator")
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .opacity(0.7)
                        }
                            .padding([.vertical, .leading]),
                        alignment: .topLeading
                    )
            }
        }
    }
}

struct CategoryViewCell_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VStack {
                CategoryViewCell(recipe: Bundle.main.decode(Recipe.self, from: "mockData.json"))
                CategoryViewCell(recipe: Recipe(creditsText: "", id: 0, aggregateLikes: 0, title: "", sourceUrl: "", image: "", imageType: "", readyInMinutes: 0, dishTypes: [], extendedIngredients: [], analyzedInstructions: []))
            }
        }
    }
}
