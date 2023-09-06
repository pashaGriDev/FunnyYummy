//
//  RecipeScreenViewModel.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 04.09.2023.
//

import Foundation

@MainActor
final class RecipeScreenViewModel: ObservableObject {
    
    private let networkService: NetworkManager
    
    init(networkService: NetworkManager = .init()) {
        self.networkService = networkService
    }
    
    @Published var detailRecipe: Recipe?
    
    var steps: [Step] {
        detailRecipe?.analyzedInstructions?.first?.steps ?? []
    }
    
    func getFullRecipe(id: Int) async {
        do {
            detailRecipe = try await networkService.getFullData(by: [id]).first
        } catch {
//            print(error.localizedDescription)
            detailRecipe = mokRandomRecip
            print("Ошибка связанная с запросом дданных!!! Происходит подмена данных")
        }
    }
    
}
