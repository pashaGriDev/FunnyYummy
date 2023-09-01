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
    @Published var dishType: DishTypes = .mainCourse
    @Published var trending = [Recipe]()
    @Published var categoryRecipe = [Recipe]()
    
    init() {
        Task {
            await fetchTrendingRecipe()
            await fetchDishTypeRecipe()
        }
    }
    
    func fetchTrendingRecipe() async {
        do {
            self.trending = try await networkService.fetchData(sortedBy: .popularity)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchDishTypeRecipe() async {
        do {
            self.categoryRecipe = try await networkService.fetchData(sortedBy: .popularity, forDishType: dishType)
        } catch {
            print(error.localizedDescription)
        }
    }
}
