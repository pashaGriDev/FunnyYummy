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
    @Published var trending = [Recipe]()
    
    init() {
        Task {
            await fetchTrendingRecipe()
        }
    }
    
    func fetchTrendingRecipe() async {
        do {
            self.trending = try await networkService.fetchData(sortedBy: .popularity)
        } catch {
            print(error.localizedDescription)
        }
    }
}
