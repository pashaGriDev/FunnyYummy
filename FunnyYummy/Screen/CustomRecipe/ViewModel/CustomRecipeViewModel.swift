//
//  CustomRecipeViewModel.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 06.09.2023.
//

import SwiftUI

final class CustomRecipeViewModel: ObservableObject {
    
    let dataProvider = DataProvider()
    @Published var ingredients = [Ingredient]()
    @Published var selectedDishImage: UIImage? = nil
    @Published var recipeName = ""
    @Published var serves = 2
    @Published var readyInMinutes = 15
    
    
    init() {
        addIngredients()
        addIngredients()
    }
    
    func addIngredients() {
        let ingredient = Ingredient(id: ingredients.count, image: "", name: "", amount: nil, unit: nil)
        ingredients.append(ingredient)
    }
    
    func removeIngredient(id: Int) {
        ingredients.removeAll(where: { $0.id == id })
    }
    
    func creatRecipe() {
        let id = dataProvider.recipes.count
        let recipe = Recipe(creditsText: nil, id: id, aggregateLikes: nil, title: recipeName, sourceUrl: nil, image: nil, imageType: nil, readyInMinutes: readyInMinutes, dishTypes: nil, extendedIngredients: ingredients, analyzedInstructions: nil)
        dataProvider.recipes.append(recipe)
        try? dataProvider.saveData(for: dataProvider.recipes, withKey: "treni1")
        resetCreatRecipe()
    }
    
    func resetCreatRecipe() {
        ingredients = []
        addIngredients()
        addIngredients()
        selectedDishImage = nil
        recipeName = ""
        serves = 2
        readyInMinutes = 15
    }
}

