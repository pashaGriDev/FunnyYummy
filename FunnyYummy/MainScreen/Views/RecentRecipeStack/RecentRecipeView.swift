//
//  RecentRecipeView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 29.08.2023.
//

import SwiftUI

struct RecentRecipeView: View {
    var body: some View {
        VStack {
            HeaderTitleView(title: "Recente recipe")
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(1..<10) { _ in
                        VStack(alignment: .leading) {
                            AsyncImage(url: URL(string: "https://spoonacular.com/recipeImages/716429-312x231.jpg")) { phase in
                                switch phase {
                                case let .success(image):
                                    image
                                        .resizable()
                                        .scaledToFill()
                                case .empty:
                                    ProgressView()
                                        .scaleEffect(2)
                                default:
                                    Image(systemName: "questionmark")
                                        .font(.headline)
                                }
                            }
                            .frame(width: 124, height: 124)
                            .clipped()
                            .background(.ultraThinMaterial)
                            .cornerRadius(16)
                            
                            Text("Kelewele Ghanian Recipe")
                                .font(.headline.bold())
                            Text("by Mikhail Kasharin")
                                .font(.system(size: 12))
                                .foregroundColor(.gray.opacity(0.8))
                        }
                        .frame(width: 124, height: 210)
                    }
                }
            }
        }
    }
}

struct RecentRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecentRecipeView()
    }
}
