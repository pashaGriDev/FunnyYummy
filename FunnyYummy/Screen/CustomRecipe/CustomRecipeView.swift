//
//  CustomRecipeView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 06.09.2023.
//

import SwiftUI

struct CustomRecipeView: View {
    
    @StateObject private var vm = CustomRecipeViewModel()
    @EnvironmentObject var dataProvider: DataProvider
    var body: some View {
        VStack(alignment: .leading) {
            Text("Create recipe")
                .font(.largeTitle.bold())
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    
                    ImageRecipeItem(selectedDishImage: $vm.selectedDishImage)
                    
                    RecipeNameItem(recipeName: $vm.recipeName)
                    
                    VStack(spacing: 10) {
                        PickerViewItem(selected: $vm.serves, title: "Serves", dataPicker: Array(1...10))
                        PickerViewItem(selected: $vm.readyInMinutes, title: "Cook Time", dataPicker: Array(stride(from: 5, through: 60, by: 5)))
                    }
                    
                    VStack(alignment: .leading, spacing: 50) {
                        ForEach($vm.ingredients, id: \.id) {
                            IngredientItemView(ingredient: $0) { id in
                                withAnimation(.spring()){
                                    vm.removeIngredient(id: id)
                                }
                            }
                        }
                    }
                    
                    Label("Add new ingredient", systemImage: "plus")
                        .font(.title2.bold())
                        .onTapGesture {
                            withAnimation(.spring()) {
                                vm.addIngredients()
                            }
                        }
                        .padding(.top, vm.ingredients.isEmpty ? 0 : 30)
                    
                    SaveButtonView {
                        vm.creatRecipe()
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
            .environmentObject(DataProvider())
    }
}
