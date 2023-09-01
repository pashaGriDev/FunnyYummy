//
//  API_Manager.swift
//  FunnyYummy
//
//  Created by Андрей Бородкин on 30.08.2023.
//

import Foundation
import Combine

class API_Manager: ObservableObject {
    
    // MARK: - Public interface
    
    // stores all results after fetching - response.results aka recipes
    @Published var response: Response?
   
    // returns 1 Recipe item
    func getMockData() -> Recipe {
        return  Bundle.main.decode(Recipe.self, from: "mockData.json")
    }
    
  // 1. for Random results - use sortedBy: .random
  // 2. for Popular results - use sortedBy: .popularity
  // 3. to get results by Category - use forDishType: DishTypes
  // 4. to get specific Query result - use lookingFor: "AnyString"
  // 5. how many is in range of 1..100
    
    
    func fetchData(lookingFor: String? = nil, sortedBy: SortingOptions, forDishType: DishTypes? = nil, howMany: Int? = nil) -> AnyPublisher<[Recipe], Error> {
           let endpoint = "https://api.spoonacular.com/recipes/complexSearch?addRecipeInformation=true&sort=\(sortedBy.rawValue)&fillIngredients=true&type=\(forDishType?.rawValue ?? "")&query=\(lookingFor ?? "")&number=\(howMany ?? 10)&apiKey=\(apiKey)"
           
           guard let url = URL(string: endpoint) else {
               return Empty().eraseToAnyPublisher()
           }
           
           return URLSession.shared.dataTaskPublisher(for: url)
               .tryMap { data, response in
                   guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                       throw RecipeError.invalidResponse
                   }
                   return data
               }
               .decode(type: Response.self, decoder: JSONDecoder())
               .map(\.results)
               .mapError { error in
                   if let recipeError = error as? RecipeError {
                       return recipeError
                   } else {
                       return RecipeError.invalidData
                   }
               }
               .eraseToAnyPublisher()
       }
    
//    func fetchData(lookingFor: String? = nil, sortedBy: SortingOptions, forDishType: DishTypes? = nil, howMany: Int? = nil) async throws -> [Recipe] {
//        let endpoint = "https://api.spoonacular.com/recipes/complexSearch?addRecipeInformation=true&sort=\(sortedBy.rawValue)&fillIngredients=true&type=\(forDishType?.rawValue ?? "")&query=\(lookingFor ?? "")&number=\(howMany ?? 10)&apiKey=\(apiKey)"
//        print(endpoint)
//
//        guard let url = URL(string: endpoint) else {
//            throw RecipeError.invalidURL
//        }
//
//        let (data, response) = try await URLSession.shared.data(from: url)
//
//        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//            throw RecipeError.invalidResponse
//        }
//
//        do {
//            let decoder = JSONDecoder()
//
//            let response = try decoder.decode(Response.self, from: data)
//            return response.results
//        } catch {
//            throw RecipeError.invalidData
//        }
//    }
    
    
    init() {}
}

enum SortingOptions: String {
    case random
    case popularity
}

enum RecipeError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

