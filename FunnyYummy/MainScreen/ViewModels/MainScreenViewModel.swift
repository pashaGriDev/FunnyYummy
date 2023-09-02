//
//  MainScreenViewModel.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 01.09.2023.
//

import Foundation

@MainActor
class MainScreenViewModel: ObservableObject {
    
    let networkService = NetworkManager()

    @Published var dishType: DishTypes = .appetizer
    let cousine: Cousine = Cousine.allCases.randomElement() ?? .chinese
    @Published var emptyRecipe = Recipe(creditsText: "", id: 0, aggregateLikes: 0, title: "", sourceUrl: "", image: "", imageType: "", readyInMinutes: 0, dishTypes: [], extendedIngredients: [], analyzedInstructions: [])
    @Published var trending = [Recipe]()
    @Published var categoryRecipe = [Recipe]()
    @Published var recentRecipe = [Recipe]()
    @Published var searchRecipe = [Recipe]()
    @Published var cousineRecipe = [Recipe]()
    @Published var searchText = ""
    
    init() {
        Task {
            await fetchTrendingRecipe()
            await fetchDishTypeRecipe()
            await fetchRecentRecipe()
            await fetchCousinRecipe()
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
    
    func fetchCousinRecipe() async {
        do {
            cousineRecipe = try await networkService.fetchData(sortedBy: .popularity, cousine: cousine)
        } catch {
            print(networkService.recipeError)
        }
    }
    
    func findRecipe() async {
        do {
            try await Task.sleep(nanoseconds: 300_000_000)
            searchRecipe = try await networkService.fetchData(lookingFor: searchText.lowercased(), sortedBy: .popularity, howMany: 10)
            print(searchText)
        } catch {
            print(networkService.recipeError)
        }
        
    }
}

