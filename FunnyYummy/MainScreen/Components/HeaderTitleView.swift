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
    
    let sort: SortType?
    let type: DishTypes?
    let cuisine: Сuisine?
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title.bold())
            Spacer()
            if hasNavigationLink {
                NavigationLink {
                    CategoryView(recipeList: recipeList, title: title, sort: sort, type: type, cuisine: cuisine)
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
                HeaderTitleView(title: "Title", sort: nil, type: nil, cuisine: nil)
            .previewLayout(.fixed(width: 400, height: 70))
    }
}
