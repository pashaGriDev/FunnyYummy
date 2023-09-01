//
//  FavoriteScreenView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 29.08.2023.
//

import SwiftUI

struct FavoriteScreenView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("Saved recipes")
                .font(.title.bold())
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(1..<10) { _ in
                    TrendingItemView(screen: .favorite)
                        .padding(.bottom, 25)
                }
            }
        }
        .padding(.top)
    }
}

struct FavoriteScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteScreenView()
    }
}
