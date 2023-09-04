//
//  FavoriteScreenView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 29.08.2023.
//

import SwiftUI

struct FavoriteScreenView: View {
    
    @EnvironmentObject var dataProvider: DataProvider
    @StateObject var vm = FavoriteScreenViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 30) {
                Text("Saved recipes")
                    .font(.title.bold())
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(vm.favoriteRecipes) { recipe in
                        TrendingItemView(recipe: recipe, screen: .favorite)
                    }
                }
            }
            .padding(.top)
            .task {
                await vm.fetchFavoriteRecipe(id: dataProvider.ids)
            }
        }
    }
}

struct FavoriteScreenView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FavoriteScreenView()
                .environmentObject(DataProvider())
        }
    }
}
