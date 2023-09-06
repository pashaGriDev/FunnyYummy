//
//  RecipeNameItem.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 06.09.2023.
//

import SwiftUI

struct RecipeNameItem: View {
    
    @State private var recipeName = ""
    
    var body: some View {
    TextField("Enter recipe name...", text: $recipeName)
            .padding(.leading)
            .frame(height: 46)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(Color.Button.red, lineWidth: 1)
            )
    }
}

struct RecipeNameItem_Previews: PreviewProvider {
    static var previews: some View {
        RecipeNameItem()
    }
}
