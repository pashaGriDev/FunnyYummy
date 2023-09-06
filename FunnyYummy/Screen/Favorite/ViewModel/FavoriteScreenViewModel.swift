//
//  FavoriteScreenViewModel.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 04.09.2023.
//

import Foundation
@MainActor
final class FavoriteScreenViewModel: ObservableObject {
    
    private let networkService = NetworkManager()
    @Published var favoriteRecipes = [Recipe]()
    
    func fetchFavoriteRecipe(id: [Int]) async {
        do {
            favoriteRecipes = try await networkService.getFullData(by: id)
            print(favoriteRecipes.count)
        } catch {
            print(error.localizedDescription)
        }
    }
}
