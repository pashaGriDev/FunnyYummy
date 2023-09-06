//
//  CategoryViewModel.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 05.09.2023.
//

import Foundation

@MainActor
class CategoryViewModel: ObservableObject {
    
    let networkManager = NetworkManager()
    @Published var recipes = [Recipe]()
    @Published var offset = 0
    
    var sort: SortType? = nil
    var type: DishTypes? = nil
    var cuisine: Сuisine? = nil
    
    var lastIndex: Int {
        recipes.count - 1
    }
    
    func loadingData() {
        Task {
            do {
                let recipes: [Recipe] = try await networkManager.getShortData(sort: sort, cousine: cuisine, type: type, offset: offset)
                
                self.recipes.insert(contentsOf: recipes, at: lastIndex)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
}
