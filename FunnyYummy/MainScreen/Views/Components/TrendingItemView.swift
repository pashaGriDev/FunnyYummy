//
//  TrendingItemView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 28.08.2023.
//

import SwiftUI

struct TrendingItemView: View {
    let recipe: Recipe
    let screen: ScreenSize
    
    let url = "https://spoonacular.com/recipeImages/716429-312x231.jpg"
    
    var body: some View {
        VStack(alignment: .leading) {
            ImageLoaderView(url: recipe.image)
                .frame(width: screen.screen.width, height: screen.screen.height)
            .background(
                Color.gray.opacity(0.3)
            )
            .overlay(
                overlayCard
                , alignment: .top
            )
            .clipShape(RoundedRectangle(cornerRadius: 24))
            
            Text(recipe.title)
                .font(.system(size: screen.font).bold())
                .lineLimit(2)
                .frame(width: screen.screen.width, height: screen.font * 2.4, alignment: .leading)
                .background(recipe.title.isEmpty ? .gray.opacity(0.2) : .clear)
                .cornerRadius(10)

            footer
        }
    }
    
    // Custom Overlay Rank&Bookmark
    var overlayCard: some View {
        HStack {
            HStack(spacing: 0) {
                Image(systemName: "star.fill")
                Text(recipe.rating?.formatted() ?? "5")
                    .foregroundColor(.white)
            }
            .padding(.all, 2)
            .padding(.horizontal, 4)
            .background(Color.gray.cornerRadius(8))
            Spacer()
            BookmarkView()
        }
        .padding()
    }
    // Custom Footer
    var footer: some View {
        HStack {
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 30, height: 30)
            Text("by \(recipe.creditsText)")
                .foregroundColor(.gray)
        }
    }
    
}

enum ScreenSize {
    
    case main
    case favorite
    
    var screen: CGSize {
        switch self {
        case .favorite:
            return CGSize(
                width: UIScreen.main.bounds.width - 32,
                height: 200
            )
        case .main: return CGSize(width: 280, height: 180)
        }
    }
    
    var font: Double {
        switch self {
        case .favorite: return 20
        case .main: return 16
        }
    }
}

struct TrendingItemView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TrendingItemView(recipe: Bundle.main.decode(Recipe.self, from: "mockData.json"), screen: .main)
            TrendingItemView(recipe: Bundle.main.decode(Recipe.self, from: "mockData.json"), screen: .favorite)
        }
    }
}
