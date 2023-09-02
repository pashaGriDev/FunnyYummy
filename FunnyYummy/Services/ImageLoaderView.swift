//
//  ImageLoaderView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 29.08.2023.
//

import SwiftUI

struct ImageLoaderView: View {
    
    let url: String
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
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
    }
}

struct ImageLoaderView_Previews: PreviewProvider {
    static var previews: some View {
        ImageLoaderView(url: "https://spoonacular.com/recipeImages/716429-312x231.jpg")
    }
}
