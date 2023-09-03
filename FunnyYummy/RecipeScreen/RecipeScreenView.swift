//
//  RecipeScreenView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 29.08.2023.
//

import SwiftUI

struct RecipeScreenView: View {
    let recipe: Recipe
    
    var titleRecipe: String {
        recipe.title ?? ""
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text(titleRecipe)
                .font(.title.bold())
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 30) {
                    // TODO: Picture Stack
                    VStack(alignment: .leading) {
                        ImageLoaderView(url: recipe.image ?? "")
                            .frame(
                                width: UIScreen.main.bounds.width - 32, height: 200)
                            .background(
                                Color.gray.opacity(0.3)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        
                        HStack {
                            Label(recipe.rating.formatted(), systemImage: "star.fill")
                            Text("(\(recipe.aggregateLikes ?? 0) Reviews)")
                                .foregroundColor(.gray)
                        }
                        .font(.system(size: 14))
                    }
                    //TODO: Instructions Stack
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Instructions")
                                .font(.title3.bold())
                            Spacer()
                        }
                        
                        ForEach(recipe.instruction.steps) { step in
                            HStack (alignment: .firstTextBaseline){
                                Text("\(step.number).")
                                Text(step.step)
                                
                            }
                            .font(.system(size: 18))
                        }
                    }
                    
                    VStack {
                        HStack {
                            Text("Ingredients")
                                .font(.title3.bold())
                            Spacer()
                        }
                        
                        VStack(spacing: 12) {
                            ForEach(recipe.extendedIngredients ?? []) { ingredient in
                                IngredientRowView(ingredient: ingredient)
                            }
                        }
                    }
                }
            }
        }
        .navigationHeader(title: "")
        .navigationBarBackButtonHidden(true)
        .padding([.horizontal, .top])
    }
}

struct RecipeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecipeScreenView(recipe: Bundle.main.decode(Recipe.self, from: "mockData.json"))
        }
    }
}
