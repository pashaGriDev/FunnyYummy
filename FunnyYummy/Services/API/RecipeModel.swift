//
//  RecipeModel.swift
//  FunnyYummy
//
//  Created by Андрей Бородкин on 30.08.2023.
//

import Foundation

struct RecipeModel: Codable {
    var results: [Recipe]
}
// 1. for Rating use rating
// 2. to get image use AsyncImage with url from image

struct Recipe: Codable, Identifiable {
    let creditsText: String? // название автора
    let id: Int
    let aggregateLikes: Int?
    let title: String?
    let sourceUrl: String?
    let image: String?
    let imageType: String?
    let readyInMinutes: Int?
    
    let dishTypes: [String]?
    
    // нужные продукты
    let extendedIngredients: [Ingredient]?
    
    // инструкция приготовления
    let analyzedInstructions: [Instruction]?
    
    var instruction: Instruction {
        analyzedInstructions![0]
    }
    
    // рейтинг блюда по лайкам
    // если значение nil вернет 0
    var rating: Int {
        switch aggregateLikes ?? 0 {
        case 1..<100: return 1
        case 100..<1000: return 2
        case 1000..<5000: return 3
        case 5000..<20_000: return 4
        case 20_000..<100_000: return 5
        default: return 0
        }
    }
    
}
    enum DishTypes: String, Codable, CaseIterable {
        case mainCourse = "main%20course"
        case sideDish = "side%20dish"
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

enum Сuisine: String, Codable, CaseIterable {
    case african
    case asian
    case american
    case british
    case cajun
    case caribbean
    case chinese
    case european
    case french
    case german
    case greek
    case indian
    case irish
    case italian
    case japanese
    case jewish
    case korean
    case mexican
    case nordic
    case southern
    case spanish
    case thai
    case vietnamese
}
    
    struct Instruction: Codable {
        let name: String?
        let steps: [Step]
    }
    // шаги приготовления
    struct Step: Codable, Identifiable {
        var id: Int {
            return number
        }
        
        let number: Int // номер шага
        let step: String // описание приготовления
        let ingredients: [Ingredient]? // продукты для данного шага
    }
    
    struct Ingredient: Codable, Identifiable {
        let id: Int
        let image: String
        let name: String
        let amount: Double?
        let unit: String?
        
        var correctName: String {
            name.prefix(1).capitalized + name.dropFirst()
        }
        
        var shortUnit: String {
            guard let cutUnit = unit else { return ""}
            return String(cutUnit.prefix(3))
        }
        
        var ingredientImage: String {
            "https://spoonacular.com/cdn/ingredients_250x250/\(image)"
        }
    }
