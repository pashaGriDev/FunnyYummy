//
//  IngredientItemView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 06.09.2023.
//

import SwiftUI

struct IngredientItemView: View {
    
    @Binding var ingredient: Ingredient
    @State private var amount = ""
    @State private var unit = ""
    let content: (Int) -> ()
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 10) {
                TextField("Item name", text: $ingredient.name)
                    .padding(.leading, 6)
                    .frame(width: geo.size.width * 0.4, height: 44)
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .strokeBorder(.gray, lineWidth: 1)
                    )
                
                TextField("Amount", text: Binding(
                    get: { amount },
                    set: { newValue in
                        amount = newValue
                        ingredient.amount = Double(newValue)
                    }))
                    .padding(.leading, 6)
                    .frame(width: geo.size.width * 0.22, height: 44)
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .strokeBorder(.gray, lineWidth: 1)
                    )
                
                TextField("Unit", text: Binding(
                    get: { unit },
                    set: { newValue in
                        unit = newValue
                        ingredient.unit = newValue
                    }))
                    .padding(.leading, 6)
                    .frame(width: geo.size.width * 0.2, height: 44)
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .strokeBorder(.gray, lineWidth: 1)
                    )
                
                Text("-")
                    .font(.system(size: 40))
                    .frame(width: 20, height: 20)
                    .offset(y: -2)
                    .padding(.all, 6)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .strokeBorder(.black, lineWidth: 2)
                    )
                    .onTapGesture {
                        content(ingredient.id)
                    }
            }
        }
    }
}

struct IngredientItemView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientItemView(ingredient: .constant(Ingredient(id: 0, image: "", name: "", amount: nil, unit: nil)), content: {int in })
    }
}
