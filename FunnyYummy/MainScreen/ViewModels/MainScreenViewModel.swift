//
//  MainScreenViewModel.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 01.09.2023.
//

import Foundation

@MainActor
class MainScreenViewModel: ObservableObject {
    
    let networkService = API_Manager()

    @Published var dishType: DishTypes = .appetizer
    @Published var trending = [Recipe]()
    @Published var categoryRecipe = [Recipe]()
    @Published var recentRecipe = [Recipe]()
    @Published var searchRecipe = [Recipe]()
    @Published var searchText = ""
    
    init() {
        Task {
            await fetchTrendingRecipe()
            await fetchDishTypeRecipe()
            await fetchRecentRecipe()
        }
    }
    
    func fetchTrendingRecipe(number: Int = 10) async {
        do {
            trending = try await networkService.fetchData(sortedBy: .popularity)
        } catch {
            print(networkService.recipeError)
        }
    }
    
    func fetchDishTypeRecipe() async {
        do {
            categoryRecipe = try await networkService.fetchData(sortedBy: .popularity, forDishType: dishType)
        } catch {
            print(networkService.recipeError)
        }
    }
    
    func fetchRecentRecipe() async {
        do {
            recentRecipe = try await networkService.fetchData(sortedBy: .random)
        } catch {
            print(networkService.recipeError)
        }
    }
    
    func findRecipe() async {
        do {
            try await Task.sleep(nanoseconds: 300_000_000)
            searchRecipe = try await networkService.fetchData(lookingFor: searchText, sortedBy: .popularity, forDishType: .appetizer, howMany: 10)
        } catch {
            print(networkService.recipeError)
        }
        
    }
}

