//
//  CustomRecipeView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 06.09.2023.
//

import SwiftUI

struct CustomRecipeView: View {
    
    @State private var serves = 2
    @State private var readyInMinutes = 15
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Create recipe")
                .font(.largeTitle.bold())
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ImageRecipeItem()
                    RecipeNameItem()
                    VStack(spacing: 10) {
                        PickerViewItem(selected: $serves, title: "Serves", dataPicker: Array(1...10))
                        PickerViewItem(selected: $readyInMinutes, title: "Cook Time", dataPicker: Array(stride(from: 5, through: 60, by: 5))
)
                    }
                    
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
