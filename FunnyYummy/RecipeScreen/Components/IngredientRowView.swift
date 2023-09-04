//
//  IngredientRowView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 29.08.2023.
//

import SwiftUI

struct IngredientRowView: View {
    
    let ingredient: Ingredient
    
    @State private var isSelected = false
    
    var body: some View {
        HStack(spacing: 20) {
            ImageLoaderView(url: ingredient.ingredientImage)
                .frame(width: 52, height: 52)
                .clipped()
                .cornerRadius(10)
            Text(ingredient.correctName)
                .font(.system(size: 15).bold())
                .lineLimit(1)

            Spacer(minLength: 0)
            Text("\(ingredient.amount?.formatted() ?? "") \(ingredient.shortUnit)")
                .foregroundColor(Color.Text.gray)
                .font(.system(size: 14))
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .foregroundColor(isSelected ? Color.Button.red : Color.Button.black)
                .frame(width: 23, height: 23)
        }
        .frame(height: 76)
        .onTapGesture {
            isSelected.toggle()
        }
        .padding(.horizontal)
        .background(Color.Button.gray.opacity(0.2).cornerRadius(10))
    }
}

//struct IngredientRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        IngredientRowView(ingredient: Bundle.main.decode(Recipe.self, from: "mockData.json").extendedIngredients?[5] ?? Ingredient(id: 0, image: "", name: "", amount: 0, unit: ""))
//    }
//}
