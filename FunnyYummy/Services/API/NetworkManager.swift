//
//  API_Manager.swift
//  FunnyYummy
//
//  Created by Андрей Бородкин on 30.08.2023.
//

import Foundation

// MARK: - SpoonacularURL

enum SpoonacularURL: String {
    case short = "https://api.spoonacular.com/recipes/complexSearch?addRecipeInformation=false"
    case full = "https://api.spoonacular.com/recipes/complexSearch?addRecipeInformation=true&fillIngredients=true"
    case byIDs = "https://api.spoonacular.com/recipes/informationBulk?ids="
}

// MARK: - NetworkManager

final class NetworkManager: ObservableObject {

    private func fetchData<T: Decodable>(url urlSting: String, model: T.Type) async throws -> T {
        
        guard let url = URL(string: urlSting) else {
            throw RecipeError.invalidURL
        }
        
        guard let (data, response) = try? await URLSession.shared.data(from: url) else {
            throw RecipeError.failedRequest
        }
        
        if let resp = response as? HTTPURLResponse {
//            print("response statusCode = \(resp.statusCode)")
            
            if resp.statusCode != 200 {
                if resp.statusCode == 402 {
                    print("Смени apiKey, прошлый сдох!")
                    throw RecipeError.invalidResponse
                }
                throw RecipeError.invalidResponse
            }
        }
        
        guard let decoded = try? JSONDecoder().decode(model.self, from: data) else {
            throw RecipeError.failedDecoded
        }
        
        return decoded
    }
}

// MARK: - getFullData by [id]

extension NetworkManager {
    /// получить данные по id одному или несколько
    func getFullData(by id: [Int]) async throws -> [Recipe] {
        
        let idsString = id.map { String($0) + "," }.reduce("", +) // в конце запятая, но вроде не влияет
        let baseUrl = SpoonacularURL.byIDs.rawValue
        let url = "\(baseUrl)\(idsString)\(apiKey)"
        
        return try await fetchData(url: url, model: [Recipe].self)
    }
}

// MARK: - searchData with sort, type ..., and searchShortData

extension NetworkManager {
    /// дает полный набор данных, но быстрей убивается ключ
    func searchData(by text: String?,
                    sort: SortType? = nil,
                    cousine: Сuisine? = nil ,
                    type: DishTypes? = nil,
                    amount: Int = 10) async throws -> [Recipe] {
        
        let baseUrl = SpoonacularURL.full.rawValue
        let amount = "&number=\(amount)"
        let query = "&query=\(text ?? "")"
        let cousine = "&cuisine=\(cousine?.rawValue ?? "")"
        let sort = "&sort=\(sort?.rawValue ?? "")"
        let type = "&type=\(type?.rawValue ?? "")"
        
        let url = "\(baseUrl)\(apiKey)\(cousine)\(sort)\(type)\(query)\(amount)"
        return try await fetchData(url: url, model: RecipeModel.self).results
    }
    
    /// поиск по тексту + нужное количество ответов. По умолчанию 10
    func searchShortData(by text: String?, amount: Int = 10) async throws -> [Recipe] {
        
        let baseUrl = SpoonacularURL.short.rawValue
        let amount = "&number=\(amount)"
        let query = "&query=\(text ?? "")"
        
        let url = "\(baseUrl)\(apiKey)\(query)\(amount)"
        return try await fetchData(url: url, model: RecipeModel.self).results
    }
}


// MARK: - get shortData

extension NetworkManager {
    
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
        print(url)
        return try await fetchData(url: url, model: RecipeModel.self).results
    }
}

// MARK: - get mockData from Bundle

extension NetworkManager {
    /// return [Recipe] count 100
    func getMockData() -> [Recipe] {
        return  Bundle.main.decode(RecipeModel.self, from: "mockData.json").results
    }
}

// MARK: - RecipeError

enum RecipeError: Error {
    case invalidURL, invalidResponse, failedDecoded, failedRequest
}
