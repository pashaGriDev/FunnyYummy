//
//  MainScreenViewController.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 31.08.2023.
//

import Foundation
import Combine

class MainScreenViewController: ObservableObject {
    
    let networkService = API_Manager()
    let emptyRecipe = Recipe(creditsText: "", id: 0, aggregateLikes: 0, title: "", sourceUrl: "", image: "", imageType: "", readyInMinutes: 0, dishTypes: [], extendedIngredients: nil, analyzedInstructions: nil)
    
    @Published var trendings = [Recipe]()
    @Published var populars = [Recipe]()
    @Published var recents = [Recipe]()
    @Published var authors = [Recipe]()
    @Published var dishes: DishTypes = .mainCourse
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        
        networkService.fetchData(sortedBy: .random)
            .receive(on: RunLoop.main)
            .sink { completion in
                if case let .failure(error) = completion {
                    print("Error fetching trending data: \(error)")
                }
            } receiveValue: { [weak self] recipes in
                self?.trendings = recipes
            }
            .store(in: &cancellables)
        
//        networkService.fetchData(sortedBy: .popularity, forDishType: .mainCourse)
//            .receive(on: RunLoop.main)
//            .sink { completion in
//                if case let .failure(error) = completion {
//                    print("Error fetching dishType data: \(error)")
//                }
//            } receiveValue: { [weak self] recipes in
//                self?.populars = recipes
//            }
//            .store(in: &cancellables)
        
        $dishes
            .flatMap { [unowned self] dish in
                return self.networkService.fetchData(sortedBy: .random, forDishType: dish)
            }
            .receive(on: RunLoop.main)
            .sink { completion in
                if case let .failure(error) = completion {
                    print("Error fetching dishdishType data: \(error)")
                }
            } receiveValue: { [weak self] recipes in
                print("success")
                self?.populars = recipes
            }
            .store(in: &cancellables)

            


        
        //trendings = networkService.getMockData()
//        Task {
//            trendings = try await networkService.fetchData(sortedBy: .popularity)
//            populars = try await networkService.fetchData(sortedBy: .popularity, forDishType: .mainCourse)
//        }
        
//        $trendings
//            .map { recipes in
//                recipes.filter{ $0.rating == 5 }
//            }
//            .assign(to: \.populars, on: self)
//            .store(in: &cancellables)
    
    }
    
}
