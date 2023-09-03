//
//  API_Manager.swift
//  FunnyYummy
//
//  Created by Андрей Бородкин on 30.08.2023.
//

import Foundation

enum RecipeError: Error {
    case invalidURL, invalidResponse, failedDecoded, failedRequest
}

enum SpoonacularURL: String {
    case short = "https://api.spoonacular.com/recipes/complexSearch?addRecipeInformation=false"
    case full = "https://api.spoonacular.com/recipes/complexSearch?addRecipeInformation=true&fillIngredients=true"
    case byIDs = "https://api.spoonacular.com/recipes/informationBulk?ids="
}

class NetworkManager: ObservableObject {
    
    /// returns 1 Recipe item
        func getMockData() -> Recipe {
            return  Bundle.main.decode(Recipe.self, from: "mockData.json")
        }
    
    /// amount = 10 по умолчанию
    func getShortData(sort: SortType? = nil,
                      cousine: Сuisine? = nil ,
                      type: DishTypes? = nil,
                      amount: Int = 10) async throws -> [Recipe] {
        
        let baseUrl = SpoonacularURL.short.rawValue
        let cousine = "&cuisine=\(cousine?.rawValue ?? "")"
        let sort = "&sort=\(sort?.rawValue ?? "")"
        let type = "&type=\(type?.rawValue ?? "")"
        let amount = "&number=\(amount)"
        
        let url = "\(baseUrl)\(apiKey)\(cousine)\(sort)\(type)\(amount)"
        
        return try await fetchData(url: url, model: RecipeModel.self).results
    }
    
    /// получить данные по id одному или несколько
    func getFullData(by id: [Int]) async throws -> [Recipe] {
        
        let idsString = id.map { String($0) + "," }.reduce("", +) // в конце запятая, но вроде не влияет
        let baseUrl = SpoonacularURL.byIDs.rawValue
        let url = "\(baseUrl)\(idsString)\(apiKey)"
        
        return try await fetchData(url: url, model: [Recipe].self)
    }
    
    func searchData(by text: String?, amount: Int = 10) async throws -> [Recipe] {
        
        let baseUrl = SpoonacularURL.short.rawValue
        let amount = "&number=\(amount)"
        let query = "&query=\(text ?? "")"
        
        let url = "\(baseUrl)\(apiKey)\(query)"
        return try await fetchData(url: url, model: [Recipe].self)
    }
    
    private func fetchData<T: Decodable>(url urlSting: String, model: T.Type) async throws -> T {
        
        guard let url = URL(string: urlSting) else {
            throw RecipeError.invalidURL
        }
        
        guard let (data, response) = try? await URLSession.shared.data(from: url) else {
            throw RecipeError.failedRequest
        }
        
        if let resp = response as? HTTPURLResponse {
            print("response statusCode = \(resp.statusCode)")
            if resp.statusCode != 200 {
                throw RecipeError.invalidResponse
            }
        }
        
        guard let decoded = try? JSONDecoder().decode(model.self, from: data) else {
            throw RecipeError.failedDecoded
        }
        
        return decoded
    }
}

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








