//
//  DataProvider.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 04.09.2023.
//

import Foundation

class DataProvider: ObservableObject {
    
    @Published var ids = [Int]()
    @Published var recipes = [Recipe]()
    
    
    init() {
        do {
            ids = try loadData(forKey: "ID")
            recipes = try loadData(forKey: "treni1")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadData<T: Decodable>(forKey key: String) throws -> T {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            print("ProblemHere: \(key)")
            throw DataError.notFound(key)
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    func saveData<T: Encodable>(for value: T, withKey: String) throws {
        guard let data = try? JSONEncoder().encode(value) else {
            throw DataError.notEncode(withKey)
        }
        UserDefaults.standard.setValue(data, forKey: withKey)
        print("Saved recipes: \(recipes.count)")
    }
    
    
    //MARK: - DataError
    enum DataError: Error {
        case notFound(String)
        case notEncode(String)
    }
    
}
