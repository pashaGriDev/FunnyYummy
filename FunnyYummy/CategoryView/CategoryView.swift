//
//  CategoryView.swift
//  FunnyYummy
//
//  Created by Никита Мартьянов on 28.08.23.
//
import SwiftUI

struct CategoryView: View {
    @StateObject private var vm = CategoryViewModel()
    let recipeList: [Recipe]
    let title: String
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 16) {
                ForEach(vm.recipes.indices, id: \.self) { index in
                    CategoryViewCell(recipe: vm.recipes[index])
                        .onAppear {
                            if index == vm.recipes.count - 3 {
                                vm.offset += 10
                                vm.loadingData()
                            }
                        }
                }
            }
            .padding(.top, 20)
        }
        .onAppear {
            print("OnAppaer")
            if !recipeList.isEmpty {
                vm.recipes = recipeList
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationHeader(title: title)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoryView(recipeList: mokRecipes, title: "Trending")
        }
    }
}
