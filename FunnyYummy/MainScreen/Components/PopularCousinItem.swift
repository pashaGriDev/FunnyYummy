//
//  PopularCreatorsView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 29.08.2023.
//

import SwiftUI

struct PopularCousinItem: View {
    
    @Binding var recipe: Recipe
    
    var body: some View {
        NavigationLink(destination: RecipeScreenView(recipe: recipe)) {
            VStack {
                ImageLoaderView(url: recipe.image)
                    .frame(width: 120, height: 120)
                    .background(.ultraThinMaterial)
                    .clipShape(Circle())
                
                Text(recipe.creditsText)
                    .font(.headline)
                    .foregroundColor(.black)
            }
            .frame(width: 120, height: 150)
            .background(.clear)
        }
    }
}

struct PopularCousinItem_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PopularCousinItem(recipe: .constant(Bundle.main.decode(Recipe.self, from: "mockData.json")))
        }
    }
}
