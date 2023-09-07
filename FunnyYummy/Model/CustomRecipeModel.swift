//
//  CustomRecipeModel.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 07.09.2023.
//

import Foundation

struct CustomRecipeModel: Codable, Identifiable {
    
    let id: Int
    var recipeName: String
    let image: Data
    let serves: Int
    let readyInMinutes: Int
    let ingredients: [CustomIngredients]
    
}
struct CustomIngredients: Codable, Identifiable {
    let id: Int
    var name: String
    var amount: Double
    var unit: String
}
