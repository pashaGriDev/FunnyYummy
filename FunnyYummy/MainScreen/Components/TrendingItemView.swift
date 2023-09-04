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
    
    var titleRecipe: String {
        recipe.title ?? ""
    }
    
    var body: some View {
        NavigationLink(destination: RecipeScreenView(recipe: recipe)) {
            VStack(alignment: .leading) {
                ImageLoaderView(url: recipe.largeImage)
                    .frame(width: screen.screen.width, height: screen.screen.height)
                    .background(
                    Color.gray.opacity(0.3)
                    )
                    .overlay(
                    overlayCard
                    , alignment: .top
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                
                Text(titleRecipe)
                    .font(.system(size: screen.font).bold())
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .frame(width: screen.screen.width, height: screen.font * 2.4, alignment: .leading)
                    .background(titleRecipe.isEmpty ? .gray.opacity(0.2) : .clear)
                    .cornerRadius(10)

                footer
            }
        }
    }
    
    // Custom Overlay Rank&Bookmark
    var overlayCard: some View {
        HStack {
            if !titleRecipe.isEmpty {
                HStack(spacing: 0) {
                    Image(systemName: "star.fill")
                    Text(recipe.rating.formatted())
                        .foregroundColor(Color.Text.white)
                }
                .padding(.all, 2)
                .padding(.horizontal, 4)
                .background(Color.gray.cornerRadius(8))
            }
            Spacer()
            BookmarkView(id: recipe.id)
        }
        .padding()
    }
    // Custom Footer
    var footer: some View {
        HStack {
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 30, height: 30)
            Text("by \(recipe.creditsText ?? "no creator")")
                .padding(.leading, 6)
                .foregroundColor(Color.Text.gray)
                .frame(width: screen.screen.width - 40, height: screen.font * 2.4, alignment: .leading)
                .background(titleRecipe.isEmpty ? .gray.opacity(0.2) : .clear)
                .cornerRadius(10)
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
        case .main:
            return CGSize(width: 280, height: 180)
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
    
    static let recipe = NetworkManager().getMockData().first!
    
    static var previews: some View {
        NavigationView {
            VStack {
                TrendingItemView(recipe: recipe, screen: .main)
                TrendingItemView(recipe: MainScreenViewModel().emptyRecipe, screen: .main)
                Text(recipe.image ?? "")
            }
        }
    }
}
