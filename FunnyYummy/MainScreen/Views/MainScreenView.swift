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
                        SearchBarView(searchText: $vm.searchText) {
                            await vm.findRecipe()
                        }
                        
                        if vm.searchText.isEmpty {
                            // MARK: - Trending now
                            VStack {
                                HeaderTitleView(recipeList: vm.trending, title: "Trending now 🔥")
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 20) {
                                        ForEach(vm.trending) { recipe in
                                            TrendingItemView(recipe: recipe, screen: .main)
                                        }
                                    }
                                }
                            }
                            // MARK: - Popular category
                            VStack {
                                HeaderTitleView(title: "Popular category", hasNavigationLink: false)
                                CategorySegmentedView(vm: vm)
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 20) {
                                        ForEach($vm.categoryRecipe, content: PopularCategoryItem.init)
                                    }
                                }
                            }
                            // MARK: - Recent recipe
                            VStack {
                                HeaderTitleView(recipeList: vm.recentRecipe, title: "Recent recipe")
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 20) {
                                        ForEach($vm.recentRecipe, content: RecentRecipeItem.init)
                                    }
                                }
                            }
                            // TODO: - Popular creators
                            VStack {
                                HeaderTitleView(recipeList: [], title: "Popular creators", hasNavigationLink: true)
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 20) {
                                        ForEach(1..<10) { _ in
                                            PopularCreatorsItem()
                                        }
                                    }
                                }
                            }
                        } else {
                            CategoryView(recipeList: vm.searchRecipe, title: "")
                                .navigationBarHidden(true)
                        }
                    }
                }
            }
            .padding([.horizontal, .top])
        }
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        //NavigationView {
        MainScreenView()
        // }
    }
}
