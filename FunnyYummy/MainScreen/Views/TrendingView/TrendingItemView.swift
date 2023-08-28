//
//  TrendingItemView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 28.08.2023.
//

import SwiftUI

struct TrendingItemView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            AsyncImage(url: URL(string: "https://spoonacular.com/recipeImages/716429-312x231.jpg")) { phase in
                switch phase {
                case let .success(image):
                    image
                        .resizable()
                        .scaledToFill()
                        .overlay(
                            overlayCard
                            , alignment: .top
                        )

                case .empty:
                    ProgressView()
                        .scaleEffect(3)
                default:
                    Image(systemName: "questionmark")
                        .font(.headline)
                }
            }
            .frame(width: 280, height: 180)
            .background(
                Color.gray.opacity(0.3)
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
            Image(systemName: "bookmark")
                .foregroundColor(.gray)
                .padding(.all, 6)
                .background(
                    Circle()
                        .fill(.white)
                )
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
