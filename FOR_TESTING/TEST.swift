//
//  Response.swift
//  FunnyYummy
//
//  Created by Андрей Бородкин on 29.08.2023.
//

import Foundation
import Combine

enum Endpoint {
    case randomRecipes(_ number: String)
    case detailInformationRecipes(_ id: String)
    case findRecipes(_ name: String)
    
    
    var baseURL: URL {
        URL(string: "https://api.spoonacular.com/recipes/")!
    }

    func path() -> String {
        switch self {
        case .randomRecipes:
            return "random"
        case .detailInformationRecipes:
            return "informationBulk"
        case .findRecipes:
            return "complexSearch"
        }
    }
    
    var absoluteURL: URL? {
        let queryURL = baseURL.appendingPathComponent(self.path())
        let components = URLComponents(url: queryURL, resolvingAgainstBaseURL: true)
        
        guard var urlComponents = components else {
            return nil
        }
        
        switch self {
        case let .randomRecipes(number):
            urlComponents.queryItems = [
                URLQueryItem(name: "number", value: number),
            URLQueryItem(name: "apiKey", value: apiKey)
            ]
        case let .detailInformationRecipes(id):
            urlComponents.queryItems = [
            URLQueryItem(name: "ids", value: id),
            URLQueryItem(name: "apiKey", value: apiKey)]
        case let .findRecipes(name):
            urlComponents.queryItems = [
            URLQueryItem(name: "query", value: name),
            URLQueryItem(name: "apiKey", value: apiKey)
            
            ]
        }
        
        return urlComponents.url
    }
    init? (index: Int, text: String) {
        switch index {
        case 0: self = .randomRecipes(text)
        case 1: self = .detailInformationRecipes(text)
        case 2: self = .findRecipes(text)
        default: return nil
        }
    }
}

//var first = Endpoint(index: 2, text: "pizza")

// MARK: - Welcome

struct Welcome: Codable {
    let results: [Result]
    let offset, number, totalResults: Int
}

// MARK: - Result

struct Result: Codable {
    var id: Int
    var title: String
    var image: String
    var imageType: ImageType
}

enum ImageType: String, Codable {
    case jpg = "jpg"
}

class RecipesAPI {
    static let shared = RecipesAPI()
    var array = [Result]()
    var cancellable = Set<AnyCancellable>() // combine stuff
    
    init() {}
    
    func fetch2 (index: Int, text: String) async throws -> [Result] {
        guard let url = Endpoint(index: index, text: text)?.absoluteURL else {throw URLError(.badURL)}
        
        let (data, _ ) = try await URLSession.shared.data(from: url)
        
        do {
            return try JSONDecoder().decode(Welcome.self, from: data).results
        } catch {
            throw URLError(.cannotDecodeContentData)
        }
    }
    
    func fetch(index: Int, text: String) {
        
        guard let url = Endpoint(index: index, text: text)?.absoluteURL else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data}
            .decode(type: Welcome.self, decoder: JSONDecoder())
            .map{$0.results}
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .sink(receiveValue: { recipe in
                self.array = recipe
                print("success")
            })
            .store(in: &cancellable)
    }
    
}

enum DishTypesTest: String, Codable {
    case sideDish = "side dish"
    case lunch =    "lunch"
    case mainCourse = "main course"
    case salad = "salad"
    case mainDish = "main dish"
    case dinner = "dinner"}

struct RecipeBase {
    var id: Int
    var title: String
    var image: String
    var imageType: String
}

struct RecipeDetailed {
//    var preparationMinutes: Int
//    var cookingMinutes: Int
    var aggregateLikes: Int
    var creditsText: String
    var sourceName: String
    
    var extendedIngredients: [Ingredient]
    
    var id: Int
    var title: String
    var readyInMinutes: Int
    var servings: Int
//    var sourceURL: String
    var image: String
//    var imageType: String
//    var summary: String
    //var dishTypes: [DishTypes]
    
//    var instructions: String
    var analyzedInstructions: [Instruction]
}
