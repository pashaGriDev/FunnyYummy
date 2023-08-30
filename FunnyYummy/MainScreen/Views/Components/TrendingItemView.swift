//
//  TrendingItemView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 28.08.2023.
//

import SwiftUI

struct TrendingItemView: View {
    
    let url = "https://spoonacular.com/recipeImages/716429-312x231.jpg"
    
    var body: some View {
        VStack(alignment: .leading) {
            ImageLoaderView(url: url)
            .frame(width: 280, height: 180)
            .background(
                Color.gray.opacity(0.3)
            )
            .overlay(
                overlayCard
                , alignment: .top
            )
            .clipShape(RoundedRectangle(cornerRadius: 24))
            
            Text("How to shawarma at home")

            footer
        }
    }
    
    // Custom Overlay Rank&Bookmark
    var overlayCard: some View {
        HStack {
            HStack(spacing: 0) {
                Image(systemName: "star.fill")
                Text("4.5")
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
            Text("by Kasharin Mikhail")
                .foregroundColor(.gray)
        }
    }
    
}

struct TrendingItemView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingItemView()
    }
}
