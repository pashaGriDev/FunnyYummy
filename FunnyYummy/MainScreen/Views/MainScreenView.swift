//
//  MainScreenView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 27.08.2023.
//

import SwiftUI

struct MainScreenView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Get amazing recipes for cooking")
                    .font(.title.bold())
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        // MARK: - SearchBar
                        SearchBarView(searchText: $searchText)
                        
                        if searchText.isEmpty {
                            // MARK: - Trending now
                            VStack {
                                HeaderTitleView(title: "Trending now 🔥")
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 20) {
                                        ForEach(1..<10) { _ in
                                            TrendingItemView(screen: .main)
                                        }
                                    }
                                }
                            }
                            // MARK: - Popular category
                            VStack {
                                HeaderTitleView(title: "Popular category", hasNavigationLink: false)
                                CategorySegmentedView()
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 20) {
                                        ForEach(1..<10) { _ in
                                            PopularCategoryItem()
                                        }
                                    }
                                }
                            }
                            // MARK: - Recent recipe
                            VStack {
                                HeaderTitleView(title: "Recente recipe")
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 20) {
                                        ForEach(1..<10) { _ in
                                            RecentRecipeItem()
                                        }
                                    }
                                }
                            }
                            // MARK: - Recent recipe
                            VStack {
                                HeaderTitleView(title: "Popular creators")
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 20) {
                                        ForEach(1..<10) { _ in
                                            PopularCreatorsItem()
                                        }
                                    }
                                }
                            }
                        } else {
                            EmptyView()
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