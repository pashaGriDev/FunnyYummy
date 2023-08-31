//
//  API_Testing_View2nd.swift
//  FunnyYummy
//
//  Created by Андрей Бородкин on 30.08.2023.
//

import SwiftUI

struct API_Testing_View2nd: View {
    @StateObject private var apiManager = API_Manager()
    let stubRecipe = Recipe(creditsText: "", id: 0, aggregateLikes: 0, title: "", sourceUrl: "", image: "", imageType: "", readyInMinutes: 0, dishTypes: [".dinner"], extendedIngredients: nil, analyzedInstructions: nil)
    
    var body: some View {
        NavigationView {
            List(apiManager.response?.results ?? [stubRecipe]) { item in
                VStack(spacing: 20){
                    
                    Text(item.title)
                        .bold()
                        .font(.title3)
                    
                    
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
                    
                    Text(item.aggregateLikes, format: .number)
                    
                    Text("Instr")
                    List(item.analyzedInstructions?[0].steps ?? [Step(number: 1, step: "", ingredients: nil)]) {step in
                        Text(step.number, format: .number)
                    }
                    Text("Igredients")
                    Text(item.extendedIngredients?[0].name ?? "error")
                }
            }
            .toolbar{
                Button("Fetch Data") {
                    Task {
                        do {
                            try await apiManager.fetchData(lookingFor: "Salmon", sortedBy: .random, forDishType: nil, howMany: 2)
                        } catch  RecipeError.invalidURL {
                            print("Invalid URL")
                        } catch  RecipeError.invalidResponse {
                            print("Invalid Response")
                        } catch  RecipeError.invalidData {
                            print("Invalid Data")
                        } catch {
                            print("Unexpected error")
                        }
                    }
                }
            }
        }
    }
}


struct API_Testing_View2nd_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            API_Testing_View2nd()
        }
    }
}
