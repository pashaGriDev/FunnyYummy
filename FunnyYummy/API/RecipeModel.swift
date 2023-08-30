//
//  RecipeModel.swift
//  FunnyYummy
//
//  Created by Андрей Бородкин on 30.08.2023.
//

import Foundation

struct Response: Codable {
    var results: [Recipe]
}

struct Recipe: Codable, Identifiable {
    let creditsText: String
    let id: Int
    let aggregateLikes: Int
    let title: String
    let sourceUrl: String
    let image: String
    let imageType: String
    let readyInMinutes: Int
    
    let dishTypes: [String]
//    var extendedIngredients: [Ingredient]
//    let analyzedInstructions: [Instruction]?
//    var ingredients: [Ingredient]? {
//       var ingredientsArray = [Ingredient]()
//
//        for item in analyzedInstructions {
//            for step in item.steps {
//                for ingredient in step.ingredients {
//                    ingredientsArray.append(ingredient)
//                }
//            }
//        }
//        return ingredientsArray
//    }
}

//enum DishTypes: String, Codable {
//    case sideDish = "side dish"
//    case lunch =    "lunch"
//    case mainCourse = "main course"
//    case salad = "salad"
//    case mainDish = "main dish"
//    case dinner = "dinner"
//}

struct Instruction: Codable {
    let name: String
    let steps: [Step]
}

struct Step: Codable, Identifiable {
    var id: Int {
        return number
    }
    
    let number: Int
    let step: String
//    let ingredients: [Ingredient]
}

struct Ingredient: Codable, Identifiable {
    var id: Int
    var image: String
    var name: String
    var amount: Double
    var unit: String
}
