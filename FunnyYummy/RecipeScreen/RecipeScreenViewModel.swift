//
//  RecipeScreenViewModel.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 04.09.2023.
//

import Foundation

@MainActor
final class RecipeScreenViewModel: ObservableObject {
    
    private let networkService = NetworkManager()
    @Published var detailRecipe: Recipe?
    
    
    func getFullRecipe(id: Int) async {
        do {
            detailRecipe = try await networkService.getFullData(by: [id])[0]
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
