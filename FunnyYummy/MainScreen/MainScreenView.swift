//
//  MainScreenView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 27.08.2023.
//

import SwiftUI

struct MainScreenView: View {
    
    @StateObject private var vm = MainScreenViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Get amazing recipes for cooking")
                    .font(.title.bold())
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        // MARK: - SearchBar
                        SearchBarView(searchText: $vm.searchText)
                            .onChange(of: vm.searchText) { _ in
                                Task {
                                    await vm.findRecipe()
                                }
                            }
                        if vm.searchText.isEmpty {
                            // MARK: - Trending now
                            VStack {
                                HeaderTitleView(recipeList: vm.trending, title: "Trending now 🔥")
                                ScrollView(.horizontal, showsIndicators: false) {
                                    LazyHStack(spacing: 20) {
                                        if vm.trending.isEmpty {
                                            ForEach(1..<10) { _ in
                                                TrendingItemView(recipe: vm.emptyRecipe, screen: .main)
                                                    .disabled(true)
                                            }
                                        } else {
                                            ForEach(vm.trending) { recipe in
                                                TrendingItemView(recipe: recipe, screen: .main)
                                            }
                                        }
                                    }
                                }
                            }
                            // MARK: - Popular category
                            VStack {
                                HeaderTitleView(title: "Popular category", hasNavigationLink: false)
                                CategorySegmentedView(vm: vm)
                                ScrollView(.horizontal, showsIndicators: false) {
                                    LazyHStack(spacing: 20) {
                                        if vm.categoryRecipe.isEmpty {
                                            ForEach(1..<10) { _ in
                                                PopularCategoryItem(recipe: $vm.emptyRecipe)
                                                    .disabled(true)
                                            }
                                        } else {
                                            ForEach($vm.categoryRecipe, content: PopularCategoryItem.init)
                                        }
                                    }
                                }
                            }
                            // MARK: - Recent recipe
                            VStack {
                                HeaderTitleView(recipeList: vm.recentRecipe, title: "Recent recipe")
                                ScrollView(.horizontal, showsIndicators: false) {
                                    LazyHStack(spacing: 20) {
                                        if vm.recentRecipe.isEmpty {
                                            ForEach(1..<10) { _ in
                                                RecentRecipeItem(recipe: $vm.emptyRecipe)
                                                    .disabled(true)
                                            }
                                        } else {
                                            ForEach($vm.recentRecipe, content: RecentRecipeItem.init)
                                        }
                                    }
                                }
                            }
                            // TODO: - Any Cousin
                            VStack {
                                HeaderTitleView(recipeList: vm.cousineRecipe, title: "\(vm.cousine.rawValue.capitalized) Cousin", hasNavigationLink: true)
                                ScrollView(.horizontal, showsIndicators: false) {
                                    LazyHStack(spacing: 20) {
                                        if vm.cousineRecipe.isEmpty {
                                            ForEach(1..<10) { _ in
                                                PopularCousinItem(recipe: $vm.emptyRecipe)
                                                    .disabled(true)
                                            }
                                        } else {
                                            ForEach($vm.cousineRecipe, content: PopularCousinItem.init)
                                        }
                                    }
                                }
                            }
                        } else {
                            CategoryView(recipeList: vm.searchRecipe, title: "")
                                .navigationBarHidden(true)
                        }
                    }
                    Spacer(minLength: 50)
                }
                
            }
            .padding([.horizontal, .top])
        }
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
