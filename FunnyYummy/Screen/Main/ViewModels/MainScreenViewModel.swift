//
//  MainScreenViewModel.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 01.09.2023.
//

import Foundation

@MainActor
class MainScreenViewModel: ObservableObject {
    
    private let networkService: NetworkManager
    
    @Published var dishType: DishTypes = .mainCourse
    let cousine: Сuisine = Сuisine.allCases.randomElement() ?? .chinese
    @Published var emptyRecipe = Recipe(creditsText: "", id: 0, aggregateLikes: 0, title: "", sourceUrl: "", image: "", imageType: "", readyInMinutes: 0, dishTypes: [], extendedIngredients: [], analyzedInstructions: [])
    @Published var trending = [Recipe]()
    @Published var categoryRecipe = [Recipe]()
    @Published var recentRecipe = [Recipe]()
    @Published var searchRecipe = [Recipe]()
    @Published var cousineRecipe = [Recipe]()
    @Published var searchText = ""
    
    var offset = 0
    
    init(networkService: NetworkManager = .init()) {
        self.networkService = networkService
        
        Task {
            await fetchTrendingRecipe()
            await fetchDishTypeRecipe()
            await fetchRecentRecipe()
            await fetchCousinRecipe()
        }
    }
    
    func fetchTrendingRecipe(number: Int = 10) async {
        do {
            trending = try await networkService.getFullData(sort: .popularity)
        } catch {
            trending = mokRecipes
//            print(error)
            print("Ошибка связанная с запросом дданных!!! Происходит подмена данных")
        }
    }
    
    func fetchDishTypeRecipe() async {
        do {
            categoryRecipe = try await networkService.getFullData(sort: .popularity, type: dishType)
        } catch {
            categoryRecipe = mokRecipes
//            print(error)
            print("Ошибка связанная с запросом дданных!!! Происходит подмена данных")
        }
    }
    
    func fetchRecentRecipe() async {
        do {
            recentRecipe = try await networkService.getFullData(sort: .random)
        } catch {
            recentRecipe = mokRecipes
//            print(error)
            print("Ошибка связанная с запросом дданных!!! Происходит подмена данных")
        }
    }
    
    func fetchCousinRecipe() async {
        do {
            cousineRecipe = try await networkService.getFullData(sort: .popularity, cousine: .chinese)
        } catch {
            cousineRecipe = mokRecipes
//            print(error)
            print("Ошибка связанная с запросом дданных!!! Происходит подмена данных")
        }
    }
    
    func findRecipe() {
        Task {
            do {
                try await Task.sleep(nanoseconds: 300_000_000)
                let recipes = try await networkService.getFullData(by: searchText.lowercased(), amount: 15, offset: offset)
                
                if searchRecipe.isEmpty {
                    searchRecipe = recipes
                } else {
                    searchRecipe.insert(contentsOf: recipes, at: searchRecipe.count - 1)
                }
                
            } catch {
                searchRecipe = mokRecipes
                print("Ошибка связанная с запросом дданных!!! Происходит подмена данных")
                print(error)
            }
        }
    }
}

