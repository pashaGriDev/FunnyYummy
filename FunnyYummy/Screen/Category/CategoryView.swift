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
    
    let sort: SortType?
    let type: DishTypes?
    let cuisine: Сuisine?
    
    init(recipeList: [Recipe], title: String, sort: SortType? = nil, type: DishTypes? = nil, cuisine: Сuisine? = nil) {
        self.recipeList = recipeList
        self.title = title
        self.sort = sort
        self.type = type
        self.cuisine = cuisine
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 16) {
                ForEach(vm.recipes.indices, id: \.self) { index in
                    TrendingItemView(recipe: vm.recipes[index], screen: .favorite)
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
            vm.sort = sort
            vm.type = type
            vm.cuisine = cuisine
            
            if vm.recipes.isEmpty {
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
            CategoryView(
                recipeList: mokRecipes,
                title: "Trending"
            )
            .environmentObject(DataProvider())
        }
    }
}
