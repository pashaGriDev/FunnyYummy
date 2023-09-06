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
    let cousine: Сuisine = Сuisine.allCases.randomElement() ?? .chinese
    @Published var emptyRecipe = Recipe(creditsText: "", id: 0, aggregateLikes: 0, title: "", sourceUrl: "", image: "", imageType: "", readyInMinutes: 0, dishTypes: [], extendedIngredients: [], analyzedInstructions: [])
    @Published var trending = [Recipe]()
    @Published var categoryRecipe = [Recipe]()
    @Published var recentRecipe = [Recipe]()
    @Published var searchRecipe = [Recipe]()
    @Published var cousineRecipe = [Recipe]()
    @Published var searchText = ""
    @Published var offset: Int = 0
    
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
            trending = try await networkService.getShortData(sort: .popularity, offset: offset)
        } catch {
            trending = mokRecipes
//            print(error)
            print("Ошибка связанная с запросом дданных!!! Происходит подмена данных")
        }
    }
    
    func fetchDishTypeRecipe() async {
        do {
            categoryRecipe = try await networkService.getShortData(sort: .popularity, type: dishType)
        } catch {
            categoryRecipe = mokRecipes
//            print(error)
            print("Ошибка связанная с запросом дданных!!! Происходит подмена данных")
        }
    }
    
    func fetchRecentRecipe() async {
        do {
            recentRecipe = try await networkService.getShortData(sort: .random)
        } catch {
            recentRecipe = mokRecipes
//            print(error)
            print("Ошибка связанная с запросом дданных!!! Происходит подмена данных")
        }
    }
    
    func fetchCousinRecipe() async {
        do {
            cousineRecipe = try await networkService.getShortData(sort: .popularity, cousine: .chinese)
        } catch {
            cousineRecipe = mokRecipes
//            print(error)
            print("Ошибка связанная с запросом дданных!!! Происходит подмена данных")
        }
    }
    
    func findRecipe() async {
        do {
            try await Task.sleep(nanoseconds: 300_000_000)
            searchRecipe = try await networkService.searchShortData(by: searchText.lowercased(), amount: 50)
            print(searchText)
        } catch {
            print(error)
        }
        
    }
}

