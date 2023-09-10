//
//  CategoryViewModel.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 05.09.2023.
//

import Foundation

@MainActor
class CategoryViewModel: ObservableObject {
    
    private let networkService: NetworkManager
    
    init(networkService: NetworkManager = .init()) {
        self.networkService = networkService
    }
    
    @Published var recipes = [Recipe]()
    @Published var offset = 0
    
    var sort: SortType? = nil
    var type: DishTypes? = nil
    var cuisine: Сuisine? = nil
    var searchText: String = ""
    
    var isSearch: Bool {
        !searchText.isEmpty
    }
    
    var lastIndex: Int {
        recipes.count - 1
    }
    
    func loadingData() {
        Task {
            do {
                let recipes: [Recipe] = try await networkService.getFullData(
                    by: searchText,
                    sort: sort,
                    cousine: cuisine,
                    type: type,
                    offset: offset)
                
                self.recipes.insert(contentsOf: recipes, at: lastIndex)
                
            } catch RecipeError.invalidURL {
                print("invalidURL")
            } catch RecipeError.invalidResponse {
                print("invalidResponse")
            } catch RecipeError.failedRequest {
                print("failedRequest")
            } catch RecipeError.failedDecoded {
                print("failedDecoded")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
}
