//
//  PopularCreatorsView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 29.08.2023.
//

import SwiftUI

struct PopularCreatorsView: View {
    var body: some View {
        VStack {
            HeaderTitleView(title: "Popular creators")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(1..<10) { _ in
                        VStack {
                            AsyncImage(url: URL(string: "https://demotivation.ru/wp-content/uploads/2021/01/1_2Stf2unFSKZ5Nh91E-GeIw.jpeg")) { phase in
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
                            .frame(width: 120, height: 120)
                            .background(.ultraThinMaterial)
                            .clipShape(Circle())
                            
                            Text("Kasharin Mikhail")
                                .font(.headline)
                        }
                    }
                }
            }
        }
    }
}

struct PopularCreatorsView_Previews: PreviewProvider {
    static var previews: some View {
        PopularCreatorsView()
    }
}
