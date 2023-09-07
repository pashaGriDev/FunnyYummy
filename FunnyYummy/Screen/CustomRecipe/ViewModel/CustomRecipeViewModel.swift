//
//  CustomRecipeViewModel.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 06.09.2023.
//

import SwiftUI

final class CustomRecipeViewModel: ObservableObject {
    
    let dataProvider = DataProvider.instance
    @Published var ingredients = [CustomIngredients]()
    @Published var selectedDishImage: UIImage? = nil
    @Published var recipeName = ""
    @Published var serves = 2
    @Published var readyInMinutes = 15
    
    
    init() {
        addIngredients()
    }
    
    func addIngredients() {
        let ingredient = CustomIngredients(id: ingredients.count, name: "", amount: 0, unit: "")
        ingredients.append(ingredient)
    }
    
    func removeIngredient(id: Int) {
        ingredients.removeAll(where: { $0.id == id })
    }
    
    func creatRecipe() {
        let id = dataProvider.recipes.count
        guard let data = selectedDishImage?.pngData() else { return }
        let recipe = CustomRecipeModel(id: id, recipeName: recipeName, image: data, serves: serves, readyInMinutes: readyInMinutes, ingredients: ingredients)
        dataProvider.recipes.append(recipe)
        try? dataProvider.saveData(for: dataProvider.recipes, withKey: "treni3")
        resetCreatRecipe()
    }
    
    func updateRecipe(_ id: Int) {
        guard let data = selectedDishImage?.pngData() else { return }
        if let index = dataProvider.recipes.firstIndex(where: { $0.id == id }) {
            dataProvider.recipes[index] = CustomRecipeModel(id: id, recipeName: recipeName, image: data, serves: serves, readyInMinutes: readyInMinutes, ingredients: ingredients)
            try? dataProvider.saveData(for: dataProvider.recipes, withKey: "treni3")
        }
    }

    func resetCreatRecipe() {
        ingredients = []
        addIngredients()
        selectedDishImage = nil
        recipeName = ""
        serves = 2
        readyInMinutes = 15
    }
    
    func showCustomRecipe(_ recipe: CustomRecipeModel) {
        ingredients = recipe.ingredients
        selectedDishImage = UIImage(data: recipe.image)
        recipeName = recipe.recipeName
        serves = recipe.serves
        readyInMinutes = recipe.readyInMinutes
    }
    
    func checkData() -> Bool {
        !ingredients.isEmpty && !recipeName.isEmpty && selectedDishImage != nil
    }
}

