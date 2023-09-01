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
// 1. for Rating use rating
// 2. to get image use AsyncImage with url from image

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
    let extendedIngredients: [Ingredient]?
    let analyzedInstructions: [Instruction]?
    
    var rating: Int? {
        switch aggregateLikes {
        case 0..<100: return 1
        case 100..<1000: return 2
        case 1000..<5000: return 3
        case 5000..<20_000: return 4
        case 20_000..<100_000: return 5
        default: return 0
        }
    }
    
}
    enum DishTypes: String, Codable, CaseIterable {
        case mainCourse = "main course"
        case sideDish = "side dish"
        case dessert
        case appetizer
        case salad
        case bread
        case breakfast
        case soup
        case beverage
        case sauce
        case marinade
        case fingerfood
        case snack
        case drink
        
    }
    
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
        let ingredients: [Ingredient]?
    }
    
    struct Ingredient: Codable, Identifiable {
        let id: Int
        let image: String
        let name: String
        let amount: Double?
        let unit: String?
    }
