//
//  CategoryViewModel.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 05.09.2023.
//

import Foundation

@MainActor
class CategoryViewModel: ObservableObject {
    
    let networkManager = NetworkManager()
    @Published var recipes = [Recipe]()
    @Published var offset = 0
    var lastIndex: Int {
        recipes.count - 1
    }
    
    
    init() {
        
    }
    
    func loadingData() {
        Task {
            do {
                let array: [Recipe] = try await networkManager.getShortData(offset: offset)
                recipes.insert(contentsOf: array, at: lastIndex)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
}
