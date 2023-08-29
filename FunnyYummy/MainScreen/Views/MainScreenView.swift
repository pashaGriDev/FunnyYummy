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
                        // TODO: - SearchBar
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(
                                    searchText.isEmpty ? .gray : .black
                                )
                            TextField("Search by name or symbol...", text: $searchText)
                                .foregroundColor(.black)
                                .autocorrectionDisabled(true)
                                .overlay(
                                    Image(systemName: "xmark.circle.fill")
                                        .padding()
                                        .offset(x: 10)
                                        .foregroundColor(.black)
                                        .opacity(searchText.isEmpty ? 0 : 1)
                                        .onTapGesture {
                                            searchText = ""
                                        }
                                    , alignment: .trailing
                                )
                        }
                        .font(.headline)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .strokeBorder(
                                    Color.gray,
                                    lineWidth: 2
                                )
                        )
                        // TODO: - Trending now
                        TrendingView()
                        // TODO: - Popular category
                        PopularCategoryView()
                        // TODO: - Recent recipe
                        RecentRecipeView()
                        // TODO: - Recent recipe
                        PopularCreatorsView()
                        
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
