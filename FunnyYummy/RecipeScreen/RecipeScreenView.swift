//
//  RecipeScreenView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 29.08.2023.
//

import SwiftUI

struct RecipeScreenView: View {
    
    @StateObject var vm = RecipeScreenViewModel()
    let recipe: Recipe
    
    var titleRecipe: String {
        recipe.title ?? ""
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text(vm.detailRecipe?.title ?? "")
                .font(.title.bold())
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 30) {
                    // TODO: Picture Stack
                    VStack(alignment: .leading) {
                        ImageLoaderView(url: vm.detailRecipe?.largeImage ?? "")
                            .frame(
                                width: UIScreen.main.bounds.width - 32, height: 200)
                            .background(
                                Color.gray.opacity(0.3)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        
                        HStack {
                            Label(vm.detailRecipe?.rating.formatted() ?? "", systemImage: "star.fill")
                            Text("(\(vm.detailRecipe?.aggregateLikes ?? 0) Reviews)")
                                .foregroundColor(Color.Text.gray)
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
                        if !vm.steps.isEmpty {
                            ForEach(vm.steps) { step in
                                HStack (alignment: .firstTextBaseline){
                                    Text("\(step.number).")
                                    Text(step.step)
                                    
                                }
                                .font(.system(size: 18))
                            }
                        } else {
                            Text("This recipe does not have cooking instructions.")
                        }
                    }
                    
                    VStack {
                        HStack {
                            Text("Ingredients")
                                .font(.title3.bold())
                            Spacer()
                        }
                        
                        VStack(spacing: 12) {
                            ForEach(vm.detailRecipe?.extendedIngredients ?? []) { ingredient in
                                IngredientRowView(ingredient: ingredient)
                            }
                        }
                    }
                }
            }
        }
        .task {
            await vm.getFullRecipe(id: recipe.id)
        }
        .navigationHeader(title: "")
        .navigationBarBackButtonHidden(true)
        .padding([.horizontal, .top])
    }
}

struct RecipeScreenView_Previews: PreviewProvider {
    
    static let recipe = Bundle.main.getMokRecip()
    
    static var previews: some View {
        NavigationView {
            RecipeScreenView(recipe: recipe)
        }
    }
}
