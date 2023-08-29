//
//  TrendingView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 28.08.2023.
//

import SwiftUI

struct TrendingView: View {
    
    var body: some View {
        VStack {
           HeaderTitleView(title: "Trending now 🔥")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(1..<10) { _ in
                        TrendingItemView()
                    }
                }
            }
        }
    }
}


struct TrendingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TrendingView()
        }
    }
}
