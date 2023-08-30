//
//  API_Testing_View.swift
//  FunnyYummy
//
//  Created by Андрей Бородкин on 30.08.2023.
//

import SwiftUI

struct API_Testing_View: View {
    
    @StateObject private var apiManager = API_Manager()
  
    
    
    let stubRecipe = Recipe(creditsText: "", id: 0, aggregateLikes: 0, title: "", sourceUrl: "", image: "", imageType: "", readyInMinutes: 0, dishTypes: [".dinner"], extendedIngredients: nil, analyzedInstructions: nil)
    
    var body: some View {
        let mockDataOne = Bundle.main.decode(Recipe.self, from: "mockData.json")
        let mockDataTwo = mockDataOne
        let mockDataArray = [mockDataOne, mockDataTwo]
        
        NavigationView {
            List(mockDataArray ) { item in
                VStack(spacing: 20){
                    Text(item.rating ?? -1, format: .number)
                    
                    AsyncImage(url: URL(string: item.image)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    } placeholder: {
                        RoundedRectangle(cornerRadius: 25.0)
                            .foregroundColor(.secondary)
                    }
                    .frame(width: 120, height: 120)
                    
                    
                    Text(item.title)
                        .bold()
                        .font(.title3)
                    
                    Text(item.creditsText)
                    
                }
            }
            .toolbar{
                Button("Fetch Data") {
                    Task {
//                        do {
//                            try await apiManager.fetchData(sortedBy: .popularity, forDishType: nil)
//                        } catch  RecipeError.invalidURL {
//                            print("Invalid URL")
//                        } catch  RecipeError.invalidResponse {
//                            print("Invalid Response")
//                        } catch  RecipeError.invalidData {
//                            print("Invalid Data")
//                        } catch {
//                            print("Unexpected error")
//                        }
                    }
                }
                .disabled(true)
            }
        }
    }
}

#Preview {
    API_Testing_View()
}




