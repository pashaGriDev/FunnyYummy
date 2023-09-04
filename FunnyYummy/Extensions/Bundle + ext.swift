//
//  Boundle + Ext.swift
//  FunnyYummy
//
//  Created by dsm 5e on 29.08.2023.
//
import Foundation

//MARK: - Использование: let user = Bundle.main.decode(User.self, from: "data.json")
extension Bundle {
    func decoded33<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        return loaded
    }
}

extension Bundle {
    func getMokData() -> [Recipe] {
        let result: RecipeModel = Bundle.main.decoded33("mockData.json")
        return result.results
    }
    
    func getMokRecip() -> Recipe {
        let result: RecipeModel = Bundle.main.decoded33("mockData.json")
        return result.results.randomElement()!
    }
}
