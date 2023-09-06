//
//  ApiComponents.swift
//  FunnyYummy
//
//  Created by Павел Грицков on 03.09.23.
//

import Foundation

// MARK: - Spoonacular - sort

enum SortType: String {
    case popularity, price, time
    case maxUsedIngredients = "max-used-ingredients"
    case alcohol
    case caffeine
    case energy
    case calories
    case carbs
    case cholesterol
    case totalFat
    case saturatedFat
    case monoUnsaturatedFat = "mono-unsaturated-fat"
    case polyUnsaturatedFat = "poly-unsaturated-fat"
    case fiber
    case protein
    case sodium
    case sugar
    case random
}

// MARK: - Spoonacular - type

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
    
    var description: String {
        switch self {
        case .mainCourse: return "Main Course"
        case .sideDish: return "Side Dish"
        default: return self.rawValue.capitalized
        }
    }
}

// MARK: - Spoonacular - cuisine

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
