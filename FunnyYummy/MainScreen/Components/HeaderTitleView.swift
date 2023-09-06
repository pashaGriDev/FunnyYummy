//
//  HeaderTitleView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 28.08.2023.
//

import SwiftUI

struct HeaderTitleView: View {
    var recipeList: [Recipe] = []
    var title: String
    var hasNavigationLink = true
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title.bold())
            Spacer()
            if hasNavigationLink {
                NavigationLink {
                    CategoryView(recipeList: recipeList, title: title)
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack {
                        Text("See all")
                        Image(systemName: "arrow.right")
                    }
                }
                .font(.headline)
                .foregroundColor(Color.Button.red)
            }
        }
    }
}

struct HeaderTitleViewPreviews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VStack {
                HeaderTitleView(recipeList: mokRecipes, title: "Trending now", hasNavigationLink: false)
            }
        }
    }
}
