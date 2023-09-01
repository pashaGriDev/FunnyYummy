//
//  RecentRecipeView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 29.08.2023.
//

import SwiftUI

struct RecentRecipeItem: View {
    
    let recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            ImageLoaderView(url: recipe.image)
                .frame(width: 124, height: 124)
                .clipped()
                .background(.ultraThinMaterial)
                .cornerRadius(16)
            
            Text(recipe.title)
                .font(.headline.bold())
            Text("by Mikhail Kasharin")
                .font(.system(size: 12))
                .foregroundColor(.gray.opacity(0.8))
        }
        .frame(width: 124, height: 210)
    }
}

struct RecentRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecentRecipeItem(recipe: Bundle.main.decode(Recipe.self, from: "mockData.json"))
    }
}
