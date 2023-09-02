//
//  CategoryView.swift
//  FunnyYummy
//
//  Created by Никита Мартьянов on 28.08.23.
//
import SwiftUI

struct CategoryView: View {
    @Environment(\.dismiss) var dismiss
    let recipeList: [Recipe]
    let title: String
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                ForEach(recipeList) { recipe in
                    CategoryViewCell(recipe: recipe)
                }
            }
            .padding(.top, 20)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationHeader(title: title)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoryView(recipeList: [Bundle.main.decode(Recipe.self, from: "mockData.json")], title: "Tranding now")
        }
    }
}
