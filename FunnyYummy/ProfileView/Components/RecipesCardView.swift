//
//  RecipesCardView.swift
//  FunnyYummy
//
//  Created by dsm 5e on 30.08.2023.
//

import SwiftUI

struct RecipesCardView: View {
    
    let url = "https://spoonacular.com/recipeImages/716429-312x231.jpg"
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: url)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .overlay(
                HStack {
                    HStack(spacing: 0) {
                        Image(systemName: "star.fill")
                        Text("4.5")
                            .foregroundColor(Color.Text.white)
                    }
                    .padding(2)
                    .background(Color.gray.opacity(0.5).blur(radius: 0.5))
                    .cornerRadius(10)
                    Spacer()
                    BookmarkView()
                }
                    .padding(4)
                , alignment: .top)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            Text("How to shawarma at home")
                .font(.headline)
                .multilineTextAlignment(.leading)
        }
        .padding(8)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .frame(width: 170, height: 200)
        .shadow(color: .black.opacity(0.15), radius: 5)
    }
}

struct RecipesCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesCardView()
    }
}

