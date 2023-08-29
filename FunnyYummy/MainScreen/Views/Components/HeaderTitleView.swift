//
//  HeaderTitleView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 28.08.2023.
//

import SwiftUI

struct HeaderTitleView: View {
    var title: String
    var hasNavigationLink = true
    var content: AnyView?
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title.bold())
            Spacer()
            if hasNavigationLink {
                NavigationLink {
                    content
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack {
                        Text("See all")
                        Image(systemName: "arrow.right")
                    }
                }
                .foregroundColor(.buttonColor)
                .font(.headline)
            }
        }
    }
}

struct HeaderTitleViewPreviews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VStack {
                HeaderTitleView(title: "Trending now", hasNavigationLink: false)
                HeaderTitleView(title: "Trending now")
            }
        }
    }
}
