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
                    .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        // MARK: - SearchBar
                        SearchBarView(searchText: $vm.searchText)
                            .onChange(of: vm.searchText) { _ in
                                Task {
                                    await vm.findRecipe()
                                }
                            }
                            .padding(.horizontal)
                        if vm.searchText.isEmpty {
                            // MARK: - Trending now
                            VStack {
                                HeaderTitleView(
                                    recipeList: vm.trending,
                                    title: "Trending now 🔥",
                                    sort: .popularity, type: nil, cuisine: nil
                                )
                                .padding(.horizontal)
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
                                    .padding(.horizontal)
                                }
                            }
                            // MARK: - Popular category
                            VStack {
                                HeaderTitleView(
                                    title: "Popular category",
                                    hasNavigationLink: false,
                                    sort: .popularity, type: vm.dishType, cuisine: nil
                                )
                                .padding(.horizontal)
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
                                    .padding(.horizontal)
                                }
                            }
                            // MARK: - Recent recipe
                            VStack {
                                HeaderTitleView(
                                    recipeList: vm.recentRecipe,
                                    title: "Recent recipe",
                                    sort: .random, type: nil, cuisine: nil
                                )
                                .padding(.horizontal)
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
                                    .padding(.horizontal)
                                }
                            }
                            // TODO: - Any Cousin
                            VStack {
                                HeaderTitleView(
                                    recipeList: vm.cousineRecipe,
                                    title: "\(vm.cousine.rawValue.capitalized) Cousin", hasNavigationLink: true,
                                    sort: .popularity, type: nil, cuisine: .chinese
                                )
                                .padding(.horizontal)
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
                                    .padding(.horizontal)
                                }
                            }
                        } else {
                            CategoryView(recipeList: vm.searchRecipe, title: "")
                                .navigationBarHidden(true)
                        }
                    }
                    .padding(.bottom, 100)
                }
            }
        }
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
            .environmentObject(DataProvider())
    }
}
