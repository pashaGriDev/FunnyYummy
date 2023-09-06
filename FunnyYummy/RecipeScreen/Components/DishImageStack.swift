//
//  DishImageStack.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 05.09.2023.
//

import SwiftUI

struct DishImageStack: View {
    
    let recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            ImageLoaderView(url: recipe.largeImage)
                .frame(
                    width: UIScreen.main.bounds.width - 32, height: 200)
                .background(
                    Color.gray.opacity(0.3)
                )
                .clipShape(RoundedRectangle(cornerRadius: 16))
            
            HStack {
                Label(recipe.rating.formatted(), systemImage: "star.fill")
                Text("(\(recipe.aggregateLikes ?? 0) Reviews)")
                    .foregroundColor(Color.Text.gray)
            }
            .frame(width: .infinity, height: 14)
            .background(recipe.title?.isEmpty ?? true ? .gray.opacity(0.2) : .clear)
            .font(.system(size: 14))
        }
    }
}

struct DishImageStack_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 30) {
            DishImageStack(recipe: mokRandomRecip)
            DishImageStack(recipe: mokRandomRecip)
        }
    }
}
