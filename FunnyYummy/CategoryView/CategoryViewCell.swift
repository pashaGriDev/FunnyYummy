//
//  CategoryViewCell.swift
//  FunnyYummy
//
//  Created by dsm 5e on 29.08.2023.
//

import SwiftUI

struct CategoryViewCell: View {
    let recipe: Recipe
//    let title: String
//    let details: String
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: recipe.image)) { phase in
                switch phase {
                case let .success(image):
                    image
                        .resizable()
                        .scaledToFill()
                        .overlay(
                            Rectangle()
                                .frame(width: 40, height: 30)
                                .foregroundStyle(.ultraThinMaterial)
                                .offset(x: 20, y: 40),
                            alignment: .topLeading
                        )
                        .overlay(
                            VStack(alignment: .leading, spacing: 10) {
                                Text(recipe.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Text(recipe.creditsText)
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                    .opacity(0.7)
                            }
                            .padding(.bottom, 40),
                            alignment: .bottom
                        )
                case .empty:
                    ProgressView()
                default:
                    Image(systemName: "circle")
                }
            }
            .frame(width: 350, height: 200)
            .background(Color.gray.opacity(0.3))
            .cornerRadius(24)
            .clipped()
        }
    }
}
