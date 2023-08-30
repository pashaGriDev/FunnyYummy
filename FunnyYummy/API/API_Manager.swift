//
//  API_Manager.swift
//  FunnyYummy
//
//  Created by Андрей Бородкин on 30.08.2023.
//

import Foundation

class API_Manager: ObservableObject {
    
    
    @Published var response: Response?
    
  
    
func fetchData() async throws {
        let endpoint = "https://api.spoonacular.com/recipes/complexSearch?addRecipeInformation=true&sort=random&apiKey=\(apiKey)"
        
        guard let url = URL(string: endpoint) else {
            throw RecipeError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw RecipeError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            
            self.response = try decoder.decode(Response.self, from: data)
        } catch {
            throw RecipeError.invalidData
        }
    }
    
    
    init() {}
}

enum RecipeError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

