//
//  CustomRecipeView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 06.09.2023.
//

import SwiftUI

struct CustomRecipeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Create recipe")
                .font(.largeTitle.bold())
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ImageRecipeItem()
                    RecipeNameItem()
                    
                }
            }
        }
        .padding([.top, .horizontal])
    }
}

struct CustomRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomRecipeView()
    }
}
